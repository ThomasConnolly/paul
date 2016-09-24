class ChargesController < ApplicationController
  
  def create
<<<<<<< HEAD
  # Amount in cents
  amount = params[:stripeAmount].to_i * 100
=======
>>>>>>> stripe

# create customer in Stripe
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )
  # create charge using customer data returned by Stripe API
  charge = Stripe::Charge.create(
    :customer    => customer.id,
<<<<<<< HEAD
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
=======
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
>>>>>>> stripe
