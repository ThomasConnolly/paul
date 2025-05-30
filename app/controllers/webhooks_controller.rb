# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(
      :stripe, Rails.env.to_sym, :signing_secret
    )

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )

      Rails.logger.info "Received webhook event: #{event.type}, id: #{event.id}"

      if event.type != 'charge.succeeded'
        Rails.logger.warn "Received unexpected event type: #{event.type}"
        render json: { status: :ok }
        return
      end

      # Comment out this duplicate check for now
      # if Webhook.exists?(event_id: event.id)
      #   render json: { status: :ok, message: 'Event already processed' }
      #   return
      # end

      webhook = Webhook.create!(
        data: payload,
        event_type: event.type,
        event_id: event.id
      )

      create_stripe_report(event.data.object, webhook)

      webhook.update(status: 'processed')
      render json: { status: :ok }
    rescue JSON::ParserError => e
      Rails.logger.error "JSON parse error: #{e.message}"
      render json: { error: e.message }, status: :bad_request
    rescue Stripe::SignatureVerificationError => e
      Rails.logger.error "Signature verification failed: #{e.message}"
      render json: { error: e.message }, status: :unauthorized
    rescue StandardError => e
      Rails.logger.error "Unexpected error processing webhook: #{e.message}"
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  private

  def create_stripe_report(data_object, webhook)
    # Add your create_stripe_report method here
    Rails.logger.info 'create_stripe_report called but not implemented yet'
  end
end
