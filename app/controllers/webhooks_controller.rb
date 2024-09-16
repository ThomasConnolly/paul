# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    request.format = :json # Force the request format to JSON
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(:stripe, Rails.env.to_sym, :signing_secret)
    event = nil

    if endpoint_secret.nil? || !endpoint_secret.is_a?(String)
      Rails.logger.error('Webhook error: Missing or invalid endpoint secret')
      render json: { error: 'Missing or invalid endpoint secret' }, status: 500
      return
    end

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      Rails.logger.error("Webhook error: Invalid payload - #{e.message}")
      render json: { error: "Invalid payload: #{e.message}" }, status: 400
      return
    rescue Stripe::SignatureVerificationError => e
      Rails.logger.error("Webhook error: Invalid signature - #{e.message}")
      render json: { error: "Signature verification failed: #{e.message}" }, status: 400
      return
    end

    webhook = Webhook.create(
      event_id: event.id,
      data: event.data,
      status: :pending
    )

    Rails.logger.info("Webhook received: #{event.id}")

    case event.type
    when 'payment_intent.succeeded'
      handle_payment_intent_succeeded(event.data.object, webhook)
    end

    head :ok
  end

  private

  def handle_payment_intent_succeeded(payment_intent, webhook)
    expanded_payment_intent = Stripe::PaymentIntent.retrieve({
                                                               id: payment_intent.id,
                                                               expand: ['payment_method']
                                                             })

    donor_name = expanded_payment_intent.payment_method&.billing_details&.name

    WebhookJob.perform_later(
      webhook.id,
      'payment_intent.succeeded',
      expanded_payment_intent.to_h,
      donor_name
    )
  end
end
