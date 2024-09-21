# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :parse_json_payload

  def create
    begin
      event = Stripe::Webhook.construct_event(
        @payload, request.env['HTTP_STRIPE_SIGNATURE'], endpoint_secret
      )
    rescue JSON::ParserError => e
      Rails.logger.error "Invalid payload: #{e.message}"
      render json: { error: "Invalid payload: #{e.message}" }, status: 400
      return
    rescue Stripe::SignatureVerificationError => e
      Rails.logger.error "Invalid signature: #{e.message}"
      render json: { error: "Invalid signature: #{e.message}" }, status: 400
      return
    end

    if event.type == 'payment_intent.succeeded'
      webhook = save_webhook_to_database(event)
      WebhookJob.perform_later(webhook.id, event.data.object.id)
    end

    render json: { received: true }, status: 200
  end

  private

  def parse_json_payload
    @payload = request.body.read
    Rails.logger.info "Payload: #{@payload}"
    @parsed_payload = JSON.parse(@payload)
  rescue JSON::ParserError
    Rails.logger.error 'Invalid JSON'
    render json: { error: 'Invalid JSON' }, status: 400
  end

  def endpoint_secret
    Rails.application.credentials.dig(:stripe, Rails.env.to_sym, :signing_secret)
  end

  def save_webhook_to_database(event)
    Webhook.create!(
      data: @payload,
      event_id: event.id,
      status: 'processing'
    )
  end
end
