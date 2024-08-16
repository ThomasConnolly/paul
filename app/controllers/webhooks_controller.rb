class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials.dig(:stripe, :webhook_secret)
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

    external_id = event.id

    # Check if the webhook has already been processed
    if Webhook.find_by(external_id:)
      render json: { message: 'Webhook already processed' }, status: 200
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
      Rails.logger.info("Unhandled event type: #{event.type}")
    end

    # Save webhook to database for idempotency
    begin
      Webhook.create!(external_id:, payload:)
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("Webhook error: Could not save to database - #{e.message}")
      render json: { error: e.message }, status: 500
      return
    end

    render json: { received: true }
  end

  private

  def webhook_params
    params.require(:webhook).permit(:type, :data, :status)
  end
end
