# typed: true
# frozen_string_literal: true

class WebhookJob < ApplicationJob
  queue_as :default

  def perform(webhook_id)
    webhook = Webhook.find(webhook_id)
    webhook.update!(status: processing)

    begin
      event_data = webhook.data
      payment_intent = event_data['data']['object']
      payment_method_id = payment_intent['payment_method']

      # Retrieve the payment method to get the donor's name
      payment_method = Stripe::PaymentMethod.retrieve(payment_method_id)
      billing_details = payment_method['billing_details']
      donor_name = billing_details['name'] || 'Anonymous Donor'

      amount = payment_intent['amount']

      # Save the StripeReport
      StripeReport.create!(
        donor_name:,
        amount:,
        payment_intent_id: payment_intent['id']
      )

      webhook.update!(status: :processed)
    rescue StandardError => e
      Rails.logger.error("Webhook job error: #{e.message}")
      webhook.update!(status: :failed)
    end
  end
end
