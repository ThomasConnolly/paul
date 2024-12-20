# frozen_string_literal: true

require 'json'

class WebhookJob < ApplicationJob
  queue_as :default

  def perform(webhook_id)
    Rails.logger.info "Starting WebhookJob for webhook: #{webhook_id}"

    webhook = Webhook.find(webhook_id)

    begin
      Rails.logger.info "Webhook data: #{webhook.data}"
      json_data = JSON.parse(webhook.data)
      Rails.logger.info "Parsed JSON data: #{json_data}"
      handle_webhook(json_data, webhook)
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

  def handle_webhook(json_data, webhook)
    Rails.logger.info "Handling webhook event: #{json_data['type']} for webhook_id: #{webhook.id}"

    data_object = json_data['data']['object']
    Rails.logger.info "Data object: #{data_object}"

    case json_data['type']
    when 'payment_intent.succeeded'
      handle_payment_intent(data_object, webhook)
    when 'invoice.payment_succeeded'
      handle_invoice_payment(data_object, webhook)
    when 'charge.succeeded'
      handle_charge(data_object, webhook)
    else
      Rails.logger.warn "Unhandled event type: #{json_data['type']}"
    end
  end

  def handle_payment_intent(data_object, webhook)
    amount = data_object['amount']
    payment_method_type = data_object.dig('payment_method_details', 'type')
    process_payment(amount, payment_method_type, data_object, webhook)
  end

  def handle_invoice_payment(data_object, webhook)
    amount = data_object['amount_paid']
    payment_method_type = data_object.dig('payment_intent', 'payment_method_details', 'type')
    process_payment(amount, payment_method_type, data_object, webhook)
  end

  def handle_charge(data_object, webhook)
    amount = data_object['amount']
    payment_method_type = data_object.dig('payment_method_details', 'type')
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

    Rails.logger.info "Created StripeReport with: created_at=#{stripe_report.created_at},
      donor_name=#{name}, amount=#{amount}, stripe_fee=#{stripe_fee},
      net=#{net_amount}, payment_method_type=#{payment_method_type}"

    # Send the email
    StripeMailer.stripe_report(stripe_report).deliver_now

    webhook.update(status: 'processed')
  rescue StandardError => e
    Rails.logger.error "Error processing payment: #{e.message}"
    webhook.update(status: 'failed')
  end

  def extract_name(data_object)
    customer_id = data_object['customer']
    user = User.find_by(stripe_id: customer_id) if customer_id

    email = data_object.dig('billing_details', 'email') ||
            data_object.dig('charges', 'data', 0, 'billing_details', 'email') ||
            'unknown_email@example.com'

    name = user&.username ||
           data_object.dig('shipping', 'name') ||
           data_object.dig('charges', 'data', 0, 'billing_details', 'name') ||
           data_object.dig('payment_method_details', 'card', 'name') ||
           data_object.dig('billing_details', 'name') ||
           email ||
           data_object['customer'] ||
           'Unknown'

    Rails.logger.info "Extracted name: #{name}"
    name
  end

  def calculate_stripe_fee(amount, payment_method_type)
    case payment_method_type
    when 'card'
      (amount * 0.029 + 30).round # 2.9% + $0.30 for credit cards
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
