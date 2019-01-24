class PledgeChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @pledge = Pledge.find(current_user.pledge.id)
    @plan  = @pledge.plan
    @interval = @pledge.interval
    @interval_count = @pledge.interval_count
    @amount = @pledge.pay_this

    # customer = Stripe::Customer.retrieve(current_user.customer_id) if current_user.customer_id?
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken]
    )

    plan = Stripe::Plan.create({
      :product => {name: "Stewardship"},
      :amount => @amount,
      :interval => @interval,
      :interval_count => @interval_count,
      :currency => 'usd',
    })

    subscription = Stripe::Subscription.create({
      customer: customer.id,
      plan: plan.id
    })

      current_user.update_attributes(
      customer_id: customer.id,
      subscription_id: subscription.id,
      card_last4: params[:card_last4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_type: params[:card_brand]
    )
      @pledge.update({
        subscription_id: subscription.id,
        status: 1
        })

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to pledge_path(@pledge)
  end
end
