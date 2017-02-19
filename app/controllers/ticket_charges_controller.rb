
class TicketChargesController < ApplicationController
  
  def new
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])

  # Amount in cents
  @amount = @ticket.amount

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => @ticket.event.title,
    :currency    => 'usd'
  )
  
  @ticket.update(email: params[:stripeEmail],
    card: params[:stripeToken], customer_id: customer.id
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to ticket_charges_path
  end
end
