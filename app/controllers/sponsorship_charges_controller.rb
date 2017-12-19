class SponsorshipChargesController < ApplicationController

  def new
  end

  def create
    @sponsorship = Sponsorship.find(current_user.sponsorship.id)
    # Amount in cents
    @amount = @sponsorship.pay_this
    @plan = @sponsorship.plan

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
      )   
  
    charge = Stripe::Charge.create(
      customer_id: customer.id,
      amount:      @amount,
      description: 'Albergue support',
      currency: 'usd',
      plan: @plan
      )


  @sponsorship.update(
    source: params[:stripeToken], email: params[:stripeEmail], 
    customer_id: customer.id
    )
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to sponsorship_charge_path
  end
end
