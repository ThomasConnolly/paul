# typed: true
# frozen_string_literal: true

class WebhookJob < ApplicationJob
  queue_as :default

  def perform(webhook_id, payment_intent_id)
    payment_intent = Stripe::PaymentIntent.retrieve(payment_intent_id)
    handle_payment_intent_succeeded(webhook_id, payment_intent)
  end

  private

  def handle_payment_intent_succeeded(webhook_id, payment_intent)
    expanded_payment_intent = Stripe::PaymentIntent.retrieve(
      id: payment_intent.id,
      expand: ['payment_method']
    )

    donor_name = expanded_payment_intent.payment_method&.billing_details&.name
    donor_name = expanded_payment_intent.shipping.name if donor_name.blank? && expanded_payment_intent.shipping

    amount_value = expanded_payment_intent.amount

    StripeReport.create!(
      webhook_id:,
      donor_name: donor_name || 'Anonymous Donor',
      amount: amount_value,
      payment_intent_id: payment_intent.id
    )
  rescue StandardError => e
    Rails.logger.error("Failed to process webhook #{webhook_id}: #{e.message}")
    # You might want to implement a retry mechanism here
  end
end
