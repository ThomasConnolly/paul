class ChargesController < ApplicationController

  Stripe.api_key = ENV['SECRET_KEY']

  def new
  end
  
  def create
  # Amount in cents
  amount = params[:stripeAmount].to_i * 100

# create customer in Stripe
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )
  # create charge using customer data returned by Stripe API
  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
    flash[:notice] = "Please try again"
  end
end