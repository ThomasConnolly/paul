class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    data = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

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

    event_id = event.id

    # Check if the webhook has already been processed
    if Webhook.find_by(event_id:)
      render json: { message: 'Webhook already processed' }, status: 200
      return
    end

    # Handle the event
    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object
      begin
        payment_method = Stripe::PaymentMethod.retrieve(payment_intent.payment_method)
        cardholder_name = payment_method.billing_details.name
        Rails.logger.info("Payment succeeded for #{cardholder_name}")
        # Process the payment and use the cardholder_name as needed
      rescue Stripe::StripeError => e
        Rails.logger.error("Stripe error: #{e.message}")
        render json: { error: e.message }, status: 500
        return
      end
    when 'payment_intent.payment_failed'
      payment_intent = event.data.object
      # Handle failed payment
    else
      Rails.logger.info("Unhandled event type: #{event.type}")
    end

    # Save webhook to database for idempotency
    begin
      Webhook.create!(event_id:, data:)
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
