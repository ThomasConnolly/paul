# typed: true
# frozen_string_literal: true

class WebhookJob < ApplicationJob
  queue_as :default

  def perform(webhook)
    data = JSON.parse(webhook.data, symbolize_names: true)
    event = Stripe::Event.construct_from(data)

    case event.type
    when 'payment_intent.succeeded'
      # Handle successful payment
      webhook.update!(status: :processed)
    when 'payment_intent.payment_failed'
      # Handle failed payment
      webhook.update!(status: :failed)
    else
      # Log unhandled event types
      Rails.logger.info("Unhandled event type: #{event.type}")
    end
  rescue JSON::ParserError => e
    Rails.logger.error("JSON parsing error: #{e.message}")
    webhook.update!(status: :error)
  rescue Stripe::StripeError => e
    Rails.logger.error("Stripe error: #{e.message}")
    webhook.update!(status: :error)
  rescue StandardError => e
    Rails.logger.error("General error: #{e.message}")
    webhook.update!(status: :error)
  end
end
