# frozen_string_literal: true

require 'json'
class WebhookJob < ApplicationJob
  queue_as :default

  def perform(webhook_or_id)
    webhook = webhook_or_id.is_a?(Webhook) ? webhook_or_id : Webhook.find(webhook_or_id)

    begin
      Rails.logger.info "Processing webhook: #{webhook.event_type}"
      json_data = JSON.parse(webhook.data)

      case webhook.event_type
      when 'charge.succeeded'
        handle_charge(json_data['data']['object'], webhook)
      else
        Rails.logger.info "Ignoring event type: #{webhook.event_type}"
      end

      webhook.update(status: 'processed')
    rescue JSON::ParserError => e
      Rails.logger.error "Invalid JSON in webhook data: #{e.message}"
      webhook.update(status: 'failed')
    rescue StandardError => e
      Rails.logger.error "Error in processing webhook: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      webhook.update(status: 'failed')
    end
  end

  private

  def handle_charge(data_object, webhook)
    amount = data_object['amount']
    balance_transaction_id = data_object['balance_transaction'] # Get the txn_xxxxx ID
    donor_name = data_object['billing_details']['name'] || 'Anonymous Donor'

    begin
      if balance_transaction_id.present?
        # Make the API call to get Stripe's processing fee
        balance_transaction = Stripe::BalanceTransaction.retrieve(balance_transaction_id)
        stripe_fee = balance_transaction.fee
      else
        Rails.logger.warn 'No balance transaction ID in webhook data - using fallback'
        # Fallback for test data - estimate fee or set to 0
        stripe_fee = 0
      end

      net_amount = amount - stripe_fee

      stripe_report = StripeReport.create!(
        webhook_id: webhook.id,
        donor_name: donor_name,
        amount: amount,
        stripe_fee: stripe_fee,
        net: net_amount
      )

      Rails.logger.info "Created StripeReport: amount=#{amount}, stripe_fee=#{stripe_fee}, net=#{net_amount}"

      # Send the email
      StripeMailer.stripe_report(stripe_report.id).deliver_later
    rescue Stripe::StripeError => e
      Rails.logger.error "Stripe API error: #{e.message}"
      # For production, you might want to retry or handle gracefully
      raise e
    end
  end
end
