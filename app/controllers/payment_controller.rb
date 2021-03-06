class PaymentController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: :webhook
  
  def create
    @pledge = Pledge.find(params[:id])
    if @pledge.nil?
      redirect_to root_path
      return
    end
    @customer = if current_user.stripe_id?
      Stripe::Customer.retrieve(current_user.stripe_id)
    else
      Stripe::Customer.create(email: current_user.email)
    end
    
    current_user.update(stripe_id: @customer.id)
  
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      subscription_data: {
        items: [{ 
          plan: @pledge.plan_id,
          quantity: @pledge.dollars,
          }],
      },
      customer: @customer,
      success_url: payment_success_url + '?session_id{CHECKOUT_SESSION_ID}',
      cancel_url: payment_cancel_url
    )
      respond_to do |format|
        format.js # render create.js.erb

    end
  end
end
