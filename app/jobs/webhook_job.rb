# frozen_string_literal: true

require 'json'

class WebhookJob < ApplicationJob
  def perform(webhook_or_id)
    Rails.logger.info "Starting WebhookJob for webhook: #{webhook_or_id}"

    webhook = if webhook_or_id.is_a?(Webhook)
                webhook_or_id
              else
                Webhook.find(webhook_or_id)
              end

    begin
      json_data = JSON.parse(webhook.data)
      puts "Parsed JSON data:\n#{JSON.pretty_generate(json_data)}"
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
      data_object = json_data.dig('data', 'object')
      puts "Data object:\n#{JSON.pretty_generate(data_object)}"

      # Try multiple paths to find the name
      name = extract_name(data_object)

      amount_value = data_object['amount']
      stripe_fee_value = calculate_stripe_fee(amount_value) if amount_value
      net_amount = amount_value - stripe_fee_value if amount_value && stripe_fee_value

      puts "Extracted data - name: #{name}, amount_value: #{amount_value}, stripe_fee_value: #{stripe_fee_value}, net_amount: #{net_amount}"

      raise 'Missing required data for StripeReport creation' unless name && amount_value && stripe_fee_value && net_amount

      stripe_report = StripeReport.create!(
        webhook_id: webhook.id,
        donor_name: name,
        amount: amount_value,
        stripe_fee: stripe_fee_value,
        net: net_amount
      )

      Rails.logger.info "Created StripeReport with:
        created_at=#{stripe_report.created_at}, donor_name=#{name},
        amount=#{amount_value}, stripe_fee=#{stripe_fee_value}, net=#{net_amount}"

      webhook.update(status: 'processed')
    rescue StandardError => e
      Rails.logger.error "Error in handle_webhook: #{e.message}"
      webhook.update(status: 'failed')
    end
  end

  def extract_name(data_object)
    name = data_object.dig('charges', 'data', 0, 'billing_details', 'name') ||
           data_object.dig('payment_method_details', 'card', 'name') ||
           data_object.dig('billing_details', 'name') ||
           data_object.dig('shipping', 'name') || # Include this for CLI testing
           'Unknown'

    Rails.logger.info "Extracted name: #{name}"
    name
  end

  def calculate_stripe_fee(amount)
    # Implement your logic to calculate the Stripe fee based on the amount
    (amount * 0.029 + 30).round
  end
end
