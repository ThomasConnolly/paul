# frozen_string_literal: true

class WebhookEventsController < ApplicationController
  # ignore csrf
  skip_before_action :verify_authenticity_token

  def create
    unless valid_signatures?
      render json: { message: 'signature invalid' }, status: 400
      return
    end
    # idempotent
    unless WebhookEvent.find_by(source: params[:source], external_id:).nil?
      render json: { message: "Already procesed #{external_id}" }
      return
    end

    event = WebhookEvent.create(webhook_params)
    ProcessEventsJob.perform_later(event.id)
    render json: params
  end

  def valid_signatures?
    if params[:source] == 'stripe'
      begin
        wh_secret = Rails.application.credentials.stripe[Rails.env.to_sym][:signing_secret]

        Stripe::Webhook.construct_event(
          request.body.read,
          request.env['HTTP_STRIPE_SIGNATURE'],
          wh_secret
        )
      rescue Stripe::SignatureVerificationError => e
        return false
      end
    end
    true
  end

  def external_id
    return params[:id] if params[:source] == 'stripe'

    SecureRandom.hex
  end

  def webhook_params
    {
      source: params[:source],
      data: params.except(:source, :controller, :action).permit!,
      external_id:
    }
  end
end
