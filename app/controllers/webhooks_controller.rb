# typed: false
# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_forgery_protection
  def create
    @payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(:stripe, Rails.env.to_sym, :signing_secret)

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      render json: { error: e.message }, status: 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      render json: { error: e.message }, status: 400
      return
    end

    # Handle the event
    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object
      # Handle successful payment
    when 'payment_intent.payment_failed'
      payment_intent = event.data.object
      # Handle failed payment
    else
      puts "Unhandled event type: #{event.type}"
    end

    render json: { received: true }
  end

  private

  # idempotent
  render(json: { message: 'Webhook already processed' }, status: 200) if Webhook.find_by(external_id:)

  def webhook_params
    params.require(:webhook).permit(:external_id, :type, :data, :status)
  end
end
