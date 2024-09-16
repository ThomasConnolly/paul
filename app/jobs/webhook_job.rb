# typed: true
# frozen_string_literal: true

class WebhookJob < ApplicationJob
  queue_as :default

  def perform(webhook_id, event_type, payment_intent_data, donor_name)
    webhook = Webhook.find(webhook_id)

    begin
      event_data = JSON.parse(webhook.data)
      donor_name_value = event_data.dig('data', 'object', 'customer_details', 'name') || donor_name || 'Anonymous Donor'
      amount = event_data.dig('data', 'object', 'amount')

      date_value = webhook.created_at.to_date

      Rails.logger.info("Donor Name: #{donor_name_value}")
      Rails.logger.info("Amount: #{amount}")

      StripeReport.create!(
        donor_name: donor_name_value,
        amount: amount / 100.0, # Assuming amount is in cents
        webhook_id: webhook.id,
        date: date_value
      )

      webhook.update!(status: :processed)
    rescue StandardError => e
      Rails.logger.error("Webhook job error: #{e.message}")
      webhook.update!(status: :failed)
    end
  end
end
