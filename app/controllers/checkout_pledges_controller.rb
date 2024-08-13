# typed: false
# frozen_string_literal: true

class CheckoutPledgesController < ApplicationController
  protect_from_forgery except: :webhook
  before_action :authenticate_user!

  def create
    @pledge = Pledge.find(params[:id])
    if @pledge.nil?
      redirect_to(root_path)
      return
    end

    @customer = find_or_create_stripe_customer
    current_user.update(stripe_id: @customer.id)

    create_stripe_checkout_session(@pledge, @customer)
  end

  private

  def find_or_create_stripe_customer
    if current_user.stripe_id?
      Stripe::Customer.retrieve(current_user.stripe_id)
    else
      Stripe::Customer.create(email: current_user.email)
    end
  end

  def create_stripe_checkout_session(_pledge, _customer)
    Stripe::Checkout::Session.create(
      mode: 'subscription',
      success_url: "#{checkout_pledges_success_url}?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: pledges_url,
      line_items: [{
        price_data: {
          unit_amount: (@pledge.dollars.to_i * 100),
          currency: 'usd',
          product_data: {
            name: 'Pledge donation'
          },
          recurring: {
            interval: @pledge.plan.to_s
          }
        },
        quantity: 1
      }],
      customer: @customer.id,
      metadata: {
        pledge_id: @pledge.id
      }
    )
  end
end
