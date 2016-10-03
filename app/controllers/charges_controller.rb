class ChargesController < ApplicationController
  
  def create

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:amount],
      :description => "Payment to St. Paul's",
      :currency    => 'usd'
    )

    purchase = Purchase.create(email: params[:stripeEmail],
      card: params[:stripeToken], amount: params[:amount],
      description: charge.description, currency: charge.currency,
      product_id: 1, customer_id: customer.id, uuid: SecureRandom.uuid)

    redirect_to purchase

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
