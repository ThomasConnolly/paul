
class AlbergueChargesController < ApplicationController

  def new
  end

  def create
    @donation = Donation.find(params[:id])

  # Amount in cents
  @amount = @donation.pay_this

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => "Albergue Donation",
    :currency    => 'usd'
  )

  @donation.update(email: params[:stripeEmail],
    source: params[:stripeToken], customer_id: customer.id
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to albergue_charges_path
  end
end
