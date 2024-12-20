# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    Rails.logger.debug "Received webhook: #{request.body.read}"

    payload = request.body.read
    endpoint_secret = Rails.application.credentials.dig(:stripe, Rails.env.to_sym, :signing_secret)
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']

    begin
      Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      render json: { error: e.message }, status: :bad_request and return
    rescue Stripe::SignatureVerificationError => e
      render json: { error: e.message }, status: :bad_request and return
    end

    webhook = Webhook.create!(
      data: payload
    )
    Rails.logger.info "Webhook created with id: #{webhook.id}, status: #{webhook.status}"

    WebhookJob.perform_later(webhook.id)
    render json: { status: :ok }
  end
end
