class ChargesController < ApplicationController
  
  def new
  end

  def create
    #Amount in cents
    @amount = 2150

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[stripeToken]
    )
end
 #   plan = Stripe::Plan.create
 #     :amount => '
 #     :interval => 'tk'
 #     :name => 'Pledge'
 #     :currency => 'usd'
 #     :id => '???'

 #   charge = Stripe::Charge.create(
 #     :customer => customer.id or stripetoken? ?
 #     :amount => @amount,
 #     :description => "Rails Stripe customer",
 #     :currency => 'usd'
 #     :id =>
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end 
end
