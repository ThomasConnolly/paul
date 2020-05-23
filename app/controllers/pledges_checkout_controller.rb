class PledgesCheckoutController < ApplicationController
  
  def create
    @pledge = Pledge.find(params[:id])

    if @pledge.nil?
      redirect_to root_path
      return
    end
  
  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    subscription_data: {
      items: [{ 
        plan: @pledge.plan_id,
        quantity: @pledge.pay_this / 100,
         }],
      },
      customer: current_user.stripe_id
      client_reference_id: current_user.id
      success_url: checkout_success_url + '?session_id{CHECKOUT_SESSION_ID}',
      cancel_url: root_url
    )
    render json: { session_id: session.id }
  end
end