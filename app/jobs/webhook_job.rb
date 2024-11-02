# frozen_string_literal: true

class WebhookJob < ApplicationJob
  queue_as :default

  def perform(webhook_id)
    webhook = Webhook.find(webhook_id)

    begin
      json_data = JSON.parse(webhook.data)
      handle_webhook(json_data, webhook)
    rescue JSON::ParserError => e
      Rails.logger.error "Invalid JSON in webhook data: #{e.message}"
      webhook.update(status: 'failed')
    rescue StandardError => e
      Rails.logger.error "Error in processing webhook: #{e.message}"
      webhook.update(status: 'failed')
    end
  end

  private

  def handle_webhook(json_data, webhook)
    Rails.logger.info "Handling webhook event for webhook_id: #{webhook.id}"

    begin
      # date_created = webhook.created_at
      data_object = json_data.dig('data', 'object')
      name = data_object.dig('customer_details', 'name') if data_object
      amount_value = data_object['amount_total'] if data_object
      stripe_fee_value = calculate_stripe_fee(amount_value) if amount_value
      net_amount = amount_value - stripe_fee_value if amount_value && stripe_fee_value

      Rails.logger.info "Extracted data - date_created: #{date_created}, name: #{name}, amount_value: #{amount_value}, stripe_fee_value: #{stripe_fee_value}, net_amount: #{net_amount}"

      raise 'Missing required data for StripeReport creation' unless date_created && name && amount_value && stripe_fee_value && net_amount

      Rails.logger.info "Creating StripeReport with: date=#{date_created}, donor_name=#{name}, amount=#{amount_value}, stripe_fee=#{stripe_fee_value}, net=#{net_amount}"

      StripeReport.create!(
        webhook_id: webhook.id,
        # date: date_created,
        donor_name: name,
        amount: amount_value,
        stripe_fee: stripe_fee_value,
        net: net_amount
      )

      webhook.update(status: 'processed')
    rescue StandardError => e
      Rails.logger.error "Error in handle_webhook: #{e.message}"
      webhook.update(status: 'failed')
    end
  end

  def calculate_stripe_fee(amount)
    # Implement your logic to calculate the Stripe fee based on the amount
    (amount * 0.029 + 30).round
  end
end
