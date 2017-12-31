class PledgeChargesController < ApplicationController

  def new
    @pledge = Pledge.find(current_user.pledge.id)
  end

  def create

    @pledge = Pledge.find(current_user.pledge.id)
    @plan = @pledge.plan
    @amount = @pledge.pay_this
    
    customer = if current_user.stripe_id?
      Stripe::Customer.retrieve(current_user.stripe_id)
    else
      customer = Stripe::Customer.create(
      :source  => params[:stripeToken]
      )
    
    charge = Stripe::Charge.create(  
      customer: customer.id,
      amount: @amount,
      description: "Pledge Payment",
      currency: 'usd',
      plan: @plan
    )

    current_user.update(
      customer_id: customer.id,
      stripe_pledge_id: pledge_id,
      card_last4: params[:card_last4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_type: params[:card_brand] 
    )
  end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to pledge_charges_path
  end
end
