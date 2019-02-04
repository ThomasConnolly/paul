class PledgeChargesController < ApplicationController
  before_action :authenticate_user!

    def new
    end

    def create
      @pledge = Pledge.find(current_user.pledge.id)
      @interval = @pledge.interval
      @interval_count = @pledge.interval_count
      @amount = @pledge.pay_this


      # @customer = current_user.stripe_customer
      # @customer.sources.create = params[:stripeToken],
      # current_user.update_attributes(
        # card_last4: params[:card_last4],
        # card_exp_month: params[:card_exp_month],
        # card_type: params[:card_brand]
      # )

    begin
      Stripe::Plan.create(
        product: "prod_ESoh4Ns3aMDQRa",
        amount: @amount,
        interval: @interval,
        interval_count: @interval_count,
        currency: "usd"
      )
      plan = Stripe::Plan.all.data[0]

      customer = current_user.stripe_customer
      subscription = customer.subscriptions.create(
        source: params[:stripeToken],
        plan: plan.id)
      current_user.assign_attributes(stripe_pledge: subscription.id)
      current_user.save
      @pledge.update(
        subscription_id: subscription.id
      )
      @pledge.save
      # card_last4: params[:user][:card_last4],
      # card_exp_month: params[:user][:card_exp_month],
      # card_exp_year: params[:user][:card_exp_year],
      # card_type: params[:user][:card_brand]
      # )
      redirect_to root_path, notice: "The Stewardship Team thanks you for submitting this payment."
    rescue Stripe::CardError => e
        flash[:error] = e.message
        render action: :new
    end
  end
end
