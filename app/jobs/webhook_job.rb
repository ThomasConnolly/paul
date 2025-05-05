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
      when 'checkout.session.completed'
        handle_checkout_session(json_data['data']['object'], webhook)
      when 'charge.completed', 'charge.succeeded'
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

  def handle_checkout_session(data_object, webhook)
    amount = data_object['amount_total']
    payment_method_type = data_object['payment_method_types']&.first || 'unknown'

    # Handle different payment links if needed
    if data_object['payment_link'] == 'plink_dR64jZ5ut9Bv4004gi'
      Rails.logger.info "Processing ticket sale: #{data_object['id']}"
    elsif data_object['payment_link'] == 'plink_4gw5o32ih7tn4004gh'
      Rails.logger.info "Processing donation: #{data_object['id']}"
    end

    process_payment(amount, payment_method_type, data_object, webhook)
  end

  def handle_charge(data_object, webhook)
    amount = data_object['amount']

    # Safely access payment_method_details
    payment_method_type = if data_object['payment_method_details'].is_a?(Hash)
                            data_object['payment_method_details']['type']
                          else
                            'card' # Default assumption
                          end

    process_payment(amount, payment_method_type, data_object, webhook)
  end

  def process_payment(amount, payment_method_type, data_object, webhook)
    name = extract_name(data_object)
    stripe_fee = calculate_stripe_fee(amount, payment_method_type)
    net_amount = amount - stripe_fee

    stripe_report = StripeReport.create!(
      webhook_id: webhook.id,
      donor_name: name,
      amount: amount,
      stripe_fee: stripe_fee,
      net: net_amount,
      payment_method_type: payment_method_type
    )
    StripeMailer.stripe_report(stripe_report).deliver_later

    Rails.logger.info "Created StripeReport: amount=#{amount}, payment_type=#{payment_method_type}"

    # Send the email
    StripeMailer.stripe_report(stripe_report).deliver_now
  end

  def extract_name(data_object)
    # Your existing extract_name method works well already
    # [existing code]
    customer_id = data_object['customer']
    user = User.find_by(stripe_id: customer_id) if customer_id

    # Try various locations for the name
    user&.username ||
      data_object.dig('billing_details', 'name') ||
      data_object.dig('charges', 'data', 0, 'billing_details', 'name') ||
      data_object.dig('payment_method_details', 'card', 'name') ||
      data_object['customer'] ||
      'Unknown'
  end

  def calculate_stripe_fee(amount, payment_method_type)
    # Your existing calculate_stripe_fee method works well already
    # [existing code]
    case payment_method_type
    when 'card'
      ((amount * 0.029) + 30).round # 2.9% + $0.30 for credit cards
    when 'us_bank_account'
      if amount <= 500_00 # $5.00 or less
        0 # ACH transfers are free for transactions $5 or less
      else
        [amount * 0.008, 500].min # 0.8% with a $5 cap for ACH
      end
    else
      Rails.logger.warn "Unknown payment method type: #{payment_method_type}"
      0 # Default to 0 if we can't determine the fee
    end
  end
end
