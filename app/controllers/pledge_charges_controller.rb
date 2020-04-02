# frozen_string_literal: true
class PledgeChargesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @pledge = Pledge.find(current_user.pledge.id)
    @interval = @pledge.interval
    @interval_count = @pledge.interval_count
    @amount = @pledge.pay_this
    @product = @pledge.product

    # @customer = current_user.stripe_customer
    # @customer.sources.create = params[:stripeToken],
    # current_user.update_attributes(
    # card_last4: params[:card_last4],
    # card_exp_month: params[:card_exp_month],
    # card_type: params[:card_brand]
    # )

    begin
      Stripe::Plan.create(
        product: @product,
        amount: @amount,
        interval: @interval,
        interval_count: @interval_count,
        currency: 'usd'
      )
      plan = Stripe::Plan.all.data[0]

      customer = current_user.stripe_customer
      customer.sources.create(source: params[:stripeToken])

      subscription = customer.subscriptions.create(
        plan: plan.id
      )
      current_user.assign_attributes(stripe_pledge: subscription.id,
                                     card_last4: params[:card_last4],
                                     card_exp_month: params[:card_exp_month],
                                     card_exp_year: params[:card_exp_year],
                                     card_type: params[:card_brand])
      current_user.save
      @pledge.update(
        subscription_id: subscription.id
      )
      @pledge.save

      redirect_to root_path, notice: 'The Stewardship Team thanks you for submitting this payment.'
    rescue Stripe::CardError => e
      flash[:error] = e.message
      render action: :new
    end
  end
end
