class CheckoutTicketsController < ApplicationController
  #Stripe.api_key = "sk_test_0AqInf4x5zH6lqth616XDU7b"

  protect_from_forgery except: :webhook
  
  def create
    @ticket = Ticket.find(params[:id])

    if @ticket.nil?
      redirect_to root_path
      return
    end

    @customer = Stripe::Customer.create(email: @ticket.email)

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        currency: 'usd',
        amount: @ticket.amount,
        name: @ticket.event.title,
        quantity: 1
      }],
      client_reference_id: @ticket.id,
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url,
    )
      respond_to do |format|
        format.js
   
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel; end
end

  