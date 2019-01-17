class PledgeChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @pledge = Pledge.find(current_user.pledge.id)
    @email = current_user.email
    @plan = @pledge.plan
    @amount = @pledge.pay_this

    customer = Stripe::Customer.create(
      :email => @email,
      :source => params[:stripeToken]
    )

    subscription = Stripe::Subscription.create(
      :customer => customer.id,
      :plan => @plan,
      :amount => @amount
    )
      current_user.update({
      customer_id: customer.id,
      subscription_id: subscription.id,
      card_last4: params[:card_last4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_type: params[:card_brand]
    })
      @pledge.update({
        subscription_id: subscription.id,
        status: 1
        })

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to pledge_path(@pledge)
  end
end
