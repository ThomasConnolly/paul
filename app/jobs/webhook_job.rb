# frozen_string_literal: true

require 'json'

class WebhookJob < ApplicationJob
  queue_as :default

  def perform(webhook_or_id)
    webhook = webhook_or_id.is_a?(Webhook) ? webhook_or_id : Webhook.find(webhook_or_id)
  
    begin
      Rails.logger.info "Webhook data: #{webhook.data}"
      json_data = JSON.parse(webhook.data)
      Rails.logger.info "Parsed JSON data: #{json_data}"
      handle_webhook(json_data, webhook)
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

  def handle_webhook(json_data, webhook)
    Rails.logger.info "Handling webhook event: #{json_data['type']} for webhook_id: #{webhook.id}"

    data_object = json_data['data']['object']
    Rails.logger.info "Data object: #{data_object}"

    case json_data['type']
    when 'checkout.session.completed'
      handle_checkout_session(data_object, webhook)
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

  def handle_checkout_session(data_object, webhook)
    payment_link_id = data_object['payment_link']

    if payment_link_id
      case payment_link_id
      when 'plink_dR64jZ5ut9Bv4004gi'
        process_ticket_sale(data_object, webhook)
      when 'plink_4gw5o32ih7tn4004gh'
        process_donation(data_object, webhook)
      else
        Rails.logger.warn "Unhandled payment link ID: #{payment_link_id}"
        process_payment(data_object['amount_total'], 'unknown', data_object, webhook)
      end
    else
      Rails.logger.warn 'No payment link ID in checkout session'
      process_payment(data_object['amount_total'], 'unknown', data_object, webhook)
    end
  end

  def process_ticket_sale(data_object, webhook)
    # Implement ticket sale processing
    Rails.logger.info "Processing ticket sale: #{data_object['id']}"
    # Create ticket records, send confirmation emails, etc.
    amount = data_object['amount_total']
    payment_method_type = data_object['payment_method_types']&.first || 'unknown'
    process_payment(amount, payment_method_type, data_object, webhook)
  end

  def process_donation(data_object, webhook)
    # Implement donation processing
    Rails.logger.info "Processing donation: #{data_object['id']}"
    # Create donation records, send thank you emails, etc.
    amount = data_object['amount_total']
    payment_method_type = data_object['payment_method_types']&.first || 'unknown'
    process_payment(amount, payment_method_type, data_object, webhook)
  end

  def handle_payment_intent(data_object, webhook)
    amount = data_object['amount']
    payment_method_type = data_object['payment_method_types']&.first ||
                          data_object.dig('payment_method_details', 'type') ||
                          'card' # Default to 'card' if not found

    Rails.logger.info "Found payment method type: #{payment_method_type}"
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
    raise # Re-raise to be caught by the outer error handler
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
