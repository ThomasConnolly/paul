# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_forgery_protection

  def create
    unless valid_signature?
      render(json: { message: 'Invalid signature' }, status: 400)
      return
    end

    external_id = params[:id]
    data = params.except(:controller, :action, :webhook).permit!

    # idempotent
    if Webhook.find_by(external_id:)
      render(json: { message: 'Webhook already processed' }, status: 200)
      return
    end

    webhook = Webhook.create!(external_id:, data:, status: 'pending')
    render json: webhook, status: :created
    HandleWebhooksJob.perform_later(webhook)
  end

  private

  def valid_signature?
    wh_secret = Rails.application.credentials.dig(:stripe, Rails.env.to_sym, :signing_secret)
    Stripe::Webhook.construct_event(
      request.body.read,
      request.env['HTTP_STRIPE_SIGNATURE'],
      wh_secret
    )
    true
  rescue Stripe::SignatureVerificationError => e
    Rails.logger.error "signature verification failed: #{e.message}"
    false
  end

  def webhook_params
    params.require(:webhook).permit(:external_id, :data, :status)
  end
end
