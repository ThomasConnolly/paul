# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    payload = request.body.read
    Rails.logger.debug { "Received webhook: #{payload}" }

    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(:stripe, Rails.env.to_sym, :signing_secret)

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )

      if Webhook.exists?(event_id: event.id)
        render json: { status: :ok, message: 'Event already processed' }
        return
      end

      webhook = Webhook.create!(
        data: payload,
        event_type: event.type,
        event_id: event.id
      )
      Rails.logger.info "Webhook created with id: #{webhook.id}, status: #{webhook.status}, event_type: #{event.type}"

      WebhookJob.perform_later(webhook.id)
      render json: { status: :ok }
    rescue JSON::ParserError => e
      Rails.logger.error "JSON parse error: #{e.message}"
      render json: { error: e.message }, status: :bad_request
    rescue Stripe::SignatureVerificationError => e
      Rails.logger.error "Signature verification failed: #{e.message}"
      render json: { error: e.message }, status: :bad_request
    rescue StandardError => e
      Rails.logger.error "Unexpected error processing webhook: #{e.message}"
      render json: { error: e.message }, status: :internal_server_error
    end
  end
end
