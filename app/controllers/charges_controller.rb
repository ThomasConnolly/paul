class ChargesController < ApplicationController
  
  def create

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => params[:amount],
    :description => "Payment to St. Paul's",
    :currency    => 'usd'
  )

  # pledge = Pledge.create(email: params[:stripeEmail],
    # card: params[:stripeToken], amount: params[:amount],
    # decription: charge.description, currency: charge.currency,
    # customer_id: customer.id, pledge_id: pledge.id)

  # redirect_to pledge
  

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
