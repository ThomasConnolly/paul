# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(
      :stripe, Rails.env.to_sym, :signing_secret
    )

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )

      Rails.logger.info "Received webhook event: #{event.type}, id: #{event.id}"

      if event.type != 'charge.succeeded'
        Rails.logger.warn "Received unexpected event type: #{event.type}"
        render json: { status: :ok }
        return
      end

      if Webhook.exists?(event_id: event.id)
        render json: { status: :ok, message: 'Event already processed' }
        return
      end

      webhook = Webhook.create!(
        data: payload,
        event_type: event.type,
        event_id: event.id
      )

      create_stripe_report(event.data.object, webhook)

      webhook.update(status: 'processed')
      render json: { status: :ok }
    rescue JSON::ParserError => e
      Rails.logger.error "JSON parse error: #{e.message}"
      render json: { error: e.message }, status: :bad_request
    rescue Stripe::SignatureVerificationError => e
      Rails.logger.error "Signature verification failed: #{e.message}"
      render json: { error: e.message }, status: :unauthorized
    rescue StandardError => e
      Rails.logger.error "Unexpected error processing webhook: #{e.message}"
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  private

  def create_stripe_report(data_object, webhook)
    Rails.logger.info "=== Starting create_stripe_report for webhook #{webhook.id} ==="

    amount = data_object['amount']
    balance_transaction_id = data_object['balance_transaction']
    donor_name = data_object['billing_details']['name'] || 'Anonymous Donor'

    # Get Stripe fee
    if balance_transaction_id.present?
      balance_transaction = Stripe::BalanceTransaction.retrieve(balance_transaction_id)
      stripe_fee = balance_transaction.fee
    else
      stripe_fee = 0
    end

    net_amount = amount - stripe_fee

    stripe_report = StripeReport.create!(
      webhook_id: webhook.id,
      amount: amount,
      net: net_amount,
      stripe_fee: stripe_fee,
      donor_name: donor_name
    )

    # Send email
    StripeMailer.stripe_report(stripe_report.id).deliver_later

    Rails.logger.info "Successfully created StripeReport with ID: #{stripe_report.id}"
  end
end
