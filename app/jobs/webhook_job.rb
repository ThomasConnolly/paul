# frozen_string_literal: true

class WebhookJob < ApplicationJob
  queue_as :default

  def perform(webhook_id)
    webhook = Webhook.find(webhook_id)

    json_data = JSON.parse(webhook.data)
    donor_name = json_data['data']['object']['billing_details']['name']
    amount = json_data['data']['object']['amount']
    stripe_fee = calculate_stripe_fee(amount)
    net_amount = amount - stripe_fee

    webhook.update(status: 'processed')
    stripe_report = handle_checkout_session_completed(webhook.id, donor_name, amount, stripe_fee, net_amount)
    Rails.logger.info "StripeReport: #{stripe_report.inspect}"

    begin
      StripeMailer.stripe_report_email(stripe_report).deliver_now
      Rails.logger.info "StripeReport email sent successfully for webhook_id: #{webhook_id}"
    rescue StandardError => e
      Rails.logger.error "Failed to send StripeReport email: #{e.message}"
    end
  rescue JSON::ParserError => e
    Rails.logger.error "Invalid JSON in webhook data: #{e.message}"
    webhook&.update(status: 'failed')
  rescue StandardError => e
    Rails.logger.error "Error in processing webhook: #{e.message}"
    webhook&.update(status: 'failed')
  end

  private

  def handle_checkout_session_completed(webhook_id, donor_name, amount, stripe_fee, net_amount)
    Rails.logger.info "Creating StripeReport for webhook_id: #{webhook_id}, donor_name: #{donor_name}, amount: #{amount}"

    begin
      stripe_report = StripeReport.create!(
        'webhook_id' => webhook_id,
        'donor_name' => donor_name,
        'amount' => amount,
        'stripe_fee' => stripe_fee,
        'net' => net_amount
      )
      Rails.logger.info "StripeReport created successfully for webhook_id: #{webhook_id}"
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error "Failed to create StripeReport: #{e.message}"
      raise
    end

    stripe_report
  end

  def calculate_stripe_fee(amount)
    (amount * 0.029 + 30).to_i
  end
end
