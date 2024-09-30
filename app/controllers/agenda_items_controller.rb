# typed: false
# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    unless request.content_type == 'application/json'
      render json: { error: 'Invalid Content-Type' }, status: 400
      return
    end

    payload = request.body.read
    endpoint_secret = Rails.application.credentials.dig(:stripe, Rails.env.to_sym, :signing_secret)
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      render json: { error: e.message }, status: 400
      return
    rescue Stripe::SignatureVerificationError => e
      render json: { error: e.message }, status: 400
      return
    end

    @webhook = Webhook.create!(
      data: payload,
      event_type: event['type'],
      status: 'pending'
    )

    WebhookJob.perform_later(@webhook.id)
    render json: { status: :ok }
  end
end
