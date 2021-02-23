class CheckoutTicketsController < ApplicationController
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

      @ticket.update(
        customer_id: @customer.id,
        checkout: @session.id)
    end
  end

  

end

  