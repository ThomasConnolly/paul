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

  def success  # ✅ Method at the class level
    session_id = params[:session_id]
    
    # Retrieve the checkout session from Stripe
    checkout_session = Stripe::Checkout::Session.retrieve(session_id)
    
    # Update your pledge with the subscription ID
    @pledge = Pledge.find(checkout_session.metadata.pledge_id)
    @pledge.update(
      subscription_id: checkout_session.subscription,
      status: 'active'
    )
    
    render 'success'
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
