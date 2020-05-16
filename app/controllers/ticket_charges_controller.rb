class TicketChargesController < ApplicationController
  Stripe.api_key = Rails.application.credentials.stripe[:private_key]

  def new; end

  def create
    @ticket = Ticket.find(params[:ticket_id])
  
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'Ticket purchase',
        description: @ticket.event.title,     
        quantity: @ticket.quantity,
        amount: @ticket.amount,
        currency: 'usd',
      }]
    #  success_url: ticket_charges_path({CHECKOUT_SESSION_ID}),
    #  cancel_url: new_event_ticket_path
    )
  end
end

