class WebhookEventsController < ApplicationController
  # ignore csrf
  skip_before_action :verify_authenticity_token

  def create
    if !signatures_valid?
      render json: {message: "signature invalid"}, status: 400
      return
    end

    #check if already handled
    if !WebhookEvent.find_by(external_id: external_id, source: params[:source]).nil?
      render json: {}
      return
    end

    # save it
    event = WebhookEvent.create!(webhook_params)

    # and process
    ProcessEventsJob.perform_later(event.id)

    render json: params
  end

  def signatures_valid?
    if params[:source] == 'stripe'
      begin
        wh_secret = Rails.application.credentials.stripe[:signing_secret]
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