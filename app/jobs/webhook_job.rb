# typed: true
# frozen_string_literal: true

class WebhookJob < ApplicationJob
  queue_as :default

  def perform(webhook)
    data = JSON.parse(webhook, symbolize_names: true)
    event = Stripe::Event.construct_from(data)

    case event.type
    when 'payment_intent.succeeded'
      handle_payment_intent_succeeded(event)
    else
      Rails.logger.info("Unhandled event type: #{event.type}")
    end
  rescue JSON::ParserError => e
    Rails.logger.error("JSON parsing error: #{e.message}")
  rescue Stripe::StripeError => e
    Rails.logger.error("Stripe error: #{e.message}")
  rescue StandardError => e
    Rails.logger.error("General error: #{e.message}")
  end

  private

  def handle_payment_intent_succeeded(event)
    payment_intent = event.data.object
    payment_method_id = payment_intent.payment_method
    # Retrieve the payment method to get the donor's name
    payment_method = Stripe::PaymentMethod.retrieve(payment_method_id)
    donor_name = payment_method.billing_details.name
    amount = payment_intent.amount

    StripeReport.create!(
      donor_name:,
      amount:,
      payment_intent_id: payment_intent.id
    )

    Rails.logger.info("Payment succeeded for #{donor_name} with amount #{amount}")
    # Write the StripeReport and send emails
  end
end
