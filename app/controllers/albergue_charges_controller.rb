
class AlbergueChargesController < ApplicationController

  def new
  end

  def create
    @sponsor = Sponsorship.find(params[:donation_id])


  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => 27500,
    :description => "Albergue Sponsorship",
    :currency    => 'usd'
  )

  @sponsorship.update(stripe_email: params[:stripeEmail],
    source: params[:stripeToken], customer_id: customer.id
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
  end
end
