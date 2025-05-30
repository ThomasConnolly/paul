# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts 'WEBHOOK RECEIVED - MINIMAL TEST'
    Rails.logger.error 'WEBHOOK RECEIVED - MINIMAL TEST'

    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(
      :stripe, Rails.env.to_sym, :signing_secret
    )

    Rails.logger.error "Payload length: #{payload.length}"
    Rails.logger.error "Signature header present: #{sig_header.present?}"
    Rails.logger.error "Endpoint secret present: #{endpoint_secret.present?}"

    render json: { status: :ok, message: 'basic structure test successful' }
  rescue StandardError => e
    Rails.logger.error "ERROR: #{e.class} - #{e.message}"
    render json: { error: e.message }, status: :internal_server_error
  end
end
#   def create
#     Rails.logger.error '=== WEBHOOK HIT - START OF CREATE METHOD ==='
#     payload = request.body.read
#     sig_header = request.env['HTTP_STRIPE_SIGNATURE']
#     endpoint_secret = Rails.application.credentials.dig(
#       :stripe, Rails.env.to_sym, :signing_secret
#     )
#     begin
#       Rails.logger.error "Payload length: #{payload.length}"
#       Rails.logger.error "Signature header present: #{sig_header.present?}"
#       Rails.logger.error "Endpoint secret present: #{endpoint_secret.present?}"
#       Rails.logger.error 'About to construct event...'
#       event = Stripe::Webhook.construct_event(
#         payload, sig_header, endpoint_secret
#       )
#       Rails.logger.error 'Event constructed successfully'
#       # ... rest of your code
#       Rails.logger.info "Received webhook event: #{event.type}, id: #{event.id}"

#       if event.type != 'charge.succeeded'
#         Rails.logger.warn "Received unexpected event type: #{event.type}"
#         render json: { status: :ok }
#         return
#       end

#       # if Webhook.exists?(event_id: event.id)
#       #   render json: { status: :ok, message: 'Event already processed' }
#       #   return
#       # end

#       webhook = Webhook.create!(
#         data: payload,
#         event_type: event.type,
#         event_id: event.id
#       )
#       Rails.logger.info "Webhook created with id: #{webhook.id}, status: #{webhook.status}, event_type: #{event.type}"

#       create_stripe_report(event.data.object, webhook)

#       webhook.update(status: 'processed')
#       render json: { status: :ok }
#     rescue JSON::ParserError => e
#       Rails.logger.error "JSON parse error: #{e.message}"
#       render json: { error: e.message }, status: :bad_request
#     rescue Stripe::SignatureVerificationError => e
#       Rails.logger.error "Signature verification failed: #{e.message}"
#       render json: { error: e.message }, status: :unauthorized
#     rescue StandardError => e
#       Rails.logger.error "Unexpected error processing webhook: #{e.message}"
#       render json: { error: e.message }, status: :internal_server_error
#     end
#   end

#   private

#   def create_stripe_report(data_object, webhook)
#     Rails.logger.info '=== DEBUG: create_stripe_report called ==='
#     Rails.logger.info "data_object keys: #{data_object.keys.inspect}"
#     Rails.logger.info "webhook.id: #{webhook.id}"
#     # Check if StripeReport already exists for this webhook
#     if StripeReport.exists?(webhook_id: webhook.id)
#       Rails.logger.warn "StripeReport already exists for webhook #{webhook.id}, skipping creation"
#       return
#     end

#     Rails.logger.info "=== Starting create_stripe_report for webhook #{webhook.id} ==="

#     amount = data_object['amount']
#     balance_transaction_id = data_object['balance_transaction']
#     # More compact version
#     donor_name = data_object['billing_details']['name']

#     if donor_name.blank?
#       email = data_object['billing_details']['email']
#       if email.present?
#         Rails.logger.info "No name in billing_details, searching for user with email: #{email}"
#         user = User.find_by(email: email)
#         donor_name = user&.username || 'Anonymous Donor'
#         Rails.logger.info "Donor name resolved to: #{donor_name}"
#       else
#         donor_name = 'Anonymous Donor'
#       end
#     end

#     Rails.logger.info "Extracted data: amount=#{amount}, balance_transaction_id=#{balance_transaction_id}, donor_name=#{donor_name}"

#     begin
#       if balance_transaction_id.present?
#         Rails.logger.info "Retrieving balance transaction: #{balance_transaction_id}"
#         balance_transaction = Stripe::BalanceTransaction.retrieve(balance_transaction_id)
#         stripe_fee = balance_transaction.fee
#       else
#         Rails.logger.warn 'No balance transaction ID in webhook data - using fallback'
#         stripe_fee = 0
#       end

#       net_amount = amount - stripe_fee
#       Rails.logger.info "Calculated net amount: #{net_amount}"

#       stripe_report = StripeReport.create!(
#         webhook_id: webhook.id,
#         amount: amount,
#         net: net_amount,
#         stripe_fee: stripe_fee,
#         donor_name: donor_name
#       )

#       Rails.logger.info "Successfully created StripeReport with ID: #{stripe_report.id}"

#       # Send the email
#       Rails.logger.info "About to queue mailer for StripeReport #{stripe_report.id}"
#       StripeMailer.stripe_report(stripe_report.id).deliver_later
#       Rails.logger.info 'Mailer queued successfully'

#       stripe_report # Return the created report
#     rescue Stripe::StripeError => e
#       Rails.logger.error "Stripe API error in create_stripe_report: #{e.class} - #{e.message}"
#       raise e
#     rescue StandardError => e
#       Rails.logger.error "Unexpected error in create_stripe_report: #{e.class} - #{e.message}"
#       raise e
#     end
#   end
# end
