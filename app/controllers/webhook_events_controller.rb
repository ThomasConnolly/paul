class WebhookEventsController < ApplicationController
  # ignore csrf
  skip_before_action :verify_authenticity_token

  def create
    if !valid_signatures?
      render json: {message: "signature invalid"}, status: 400
      return
    end
    #check if already handled; idempotent
    if !WebhookEvent.find_by(source:params[:source], external_id: external_id).nil?
      render json: { message: "Already procesed #{ external_id }"}
      return
    end

    event = WebhookEvent.create(webhook_params)
    ProcessEventsJob.perform_later(event.id)
    render json: params
  end

  def valid_signatures?
    if params[:source] == 'stripe'
      begin
        wh_secret = ENV['STRIPE_SIGNING_SECRET']
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

  def webhook_params
    {
      source: params[:source],
      data: params.except(:source, :controller, :action).permit!,
      external_id: external_id
    }
  end

  def external_id
    return params[:id] if params[:source] == 'stripe'
    SecureRandom.hex
  end
end
