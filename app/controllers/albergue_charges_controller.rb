
class AlbergueChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create

@customer = current_user.stripe_customer
    begin
      subscription = Stripe::Subscription.create(
      source: params[:stripeToken],
      customer: @customer,
      plan: "plan_ESoIz9Qgn7cyCP"
      )
      current_user.assign_attributes(
      albergue_sponsor: subscription.id)
      current_user.save
      redirect_to root_path, notice: "Thanks for your sponsorship!"
    rescue Stripe::CardError => e
        flash.alert = e.message
        render action: :new
    end
  end
end
