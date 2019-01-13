
class ChargesController < ApplicationController

  def new
  end

  def create
    @donation = Donation.find(params[:donation_id])

  # Amount in cents
    @amount = @donation.pay_this

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => "Albergue Sponsorship",
    :currency    => 'usd'
  )

  @donation.update(stripe_email: params[:stripeEmail],
    source: params[:stripeToken], customer_id: customer.id
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
  end
end
