class ChargesController < ApplicationController

  def create

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Payment to St. Paul's",
      :currency    => 'usd'
    )

    ticket = Ticket.create(email: params[:stripeEmail],
       card: params[:stripeToken], amount: params[:amount],
       description: charge.description, currency: charge.currency,
       event_id: 1, customer_id: customer.id, uuid: SecureRandom.uuid)

    redirect_to ticket

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
