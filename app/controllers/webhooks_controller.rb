class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    data = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    webhook_secret = Rails.application.credentials.dig(:stripe, Rails.env.to_sym, :signing_secret)

    begin
      event = Stripe::Webhook.construct_event(
        data, sig_header, webhook_secret
      )
    rescue JSON::ParserError => e
      Rails.logger.error("Webhook error: Invalid payload - #{e.message}")
      render json: { error: e.message }, status: 400
      return
    rescue Stripe::SignatureVerificationError => e
      Rails.logger.error("Webhook error: Invalid signature - #{e.message}")
      render json: { error: e.message }, status: 400
      return
    end

    # Extract necessary data from the event
    event_data = JSON.parse(data)
    event_id = event_data['id']
    status = 'pending'

    # Save the webhook data to the database
    Webhook.create!(
      event_id:,
      data: event_data,
      status:
    )

    WebhookJob.perform_later(event.to_json)

    render json: { received: true }, status: 200
  end
end
