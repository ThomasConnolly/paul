class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(:stripe, :webhook_secret)

    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue JSON::ParserError => e
      Rails.logger.error("Webhook error: Invalid payload - #{e.message}")
      render json: { error: 'Invalid payload' }, status: 400
      return
    rescue Stripe::SignatureVerificationError => e
      Rails.logger.error("Webhook error: Invalid signature - #{e.message}")
      render json: { error: e.message }, status: 400
      return
    end

    Rails.logger.info("Webhook received: #{event.id}")

    if event['type'] == 'payment_intent.succeeded'
      payment_intent = event['data']['object']
      Rails.logger.info("Payment Intent: #{payment_intent}")

      charges = begin
        payment_intent['charges']['data']
      rescue StandardError
        nil
      end
      if charges.nil? || charges.empty?
        Rails.logger.error('No charges found in payment intent')
        render json: { error: 'No charges found in payment intent' }, status: 400
        return
      end

      donor_name = begin
        charges[0]['billing_details']['name']
      rescue StandardError
        'Anonymous Donor'
      end
      Rails.logger.info("Donor Name: #{donor_name}")

      begin
        Webhook.create!(
          event_id: event.id,
          data: event.to_hash,
          status: 'processing'
        )
        Rails.logger.info("Webhook saved successfully: #{event.id}")
      rescue StandardError => e
        Rails.logger.error("Failed to save webhook: #{e.message}")
        render json: { error: 'Failed to save webhook' }, status: 500
        return
      end

      WebhookJob.perform_later(event.to_hash.to_json)

      render json: { received: true }, status: 200
    else
      Rails.logger.error("Unhandled event type: #{event['type']}")
      render json: { error: 'Invalid event type' }, status: 400
    end
  end
end
