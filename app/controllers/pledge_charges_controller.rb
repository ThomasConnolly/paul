class PledgeChargesController < ApplicationController

  def new
  end

  def create
    @pledge = Pledge.find(current_user.pledge.id)
    @amount = @pledge.pay_this

   customer = Stripe::Customer.create(
    :card  => params[:stripeToken]
  )

    
   charge = Stripe::Subscription.create(
       :customer    => customer.id,
       :amount      => @amount,
       :description => "Pledge Payment",
       :currency    => 'usd',
       :plan        => @pledge.plan
      )

  
  @pledge.update(card: params[:stripeToken], customer_id: customer.id
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to pledge_charges_path
  end
end
