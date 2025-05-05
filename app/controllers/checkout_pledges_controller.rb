# frozen_string_literal: true

class CheckoutPledgesController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!

  def create
    @pledge = Pledge.find(params[:id])
    if @pledge.nil?
      redirect_to(root_path)
      return
    end

    @customer = find_or_create_stripe_customer
    current_user.update(stripe_id: @customer.id)
    create_stripe_checkout_session
  end

  # ✅ Method at the class level
  def success
    session_id = params[:session_id]

    begin
      # Retrieve the checkout session from Stripe
      checkout_session = Stripe::Checkout::Session.retrieve(session_id)

      # Update your pledge with the subscription ID
      @pledge = Pledge.find(checkout_session.metadata.pledge_id)
      @pledge.update(
        subscription_id: checkout_session.subscription,
        status: 'active'
      )

      render 'success'
    rescue Stripe::StripeError => e
      # Log the error
      Rails.logger.error "Stripe error in success callback: #{e.message}"
      redirect_to pledges_path, alert: 'There was an issue with your payment. Please contact support.'
    rescue ActiveRecord::RecordNotFound => e
      # Log the error
      Rails.logger.error "Record not found in success callback: #{e.message}"
      redirect_to pledges_path, alert: 'There was an issue with your payment. Please contact support.'
    end
  end

  private

  def find_or_create_stripe_customer
    if current_user.stripe_id?
      Stripe::Customer.retrieve(current_user.stripe_id)
    else
      Stripe::Customer.create(email: current_user.email)
    end
  end

  def create_stripe_checkout_session
    session = Stripe::Checkout::Session.create(
      mode: 'subscription',
      success_url: "#{checkout_pledges_success_url}?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: pledges_url,
      line_items: [{
        price: @pledge.price_id,
        quantity: @pledge.dollars.to_i
      }],
      customer: @customer.id,
      metadata: {
        pledge_id: @pledge.id
      }
    )

    redirect_to session.url, allow_other_host: true
  end
end
