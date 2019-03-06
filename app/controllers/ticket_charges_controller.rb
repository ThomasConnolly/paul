class TicketChargesController < ApplicationController

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @amount = @ticket.amount
  end

  def create


  customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    source: params[:stripeToken]
  )
  Stripe::Charge.create(
    customer: customer.id,
    amount: @amount,
    description: @ticket.event.title,
    currency: 'usd'
  )

  @ticket.update(email: params[:stripeEmail],
    source: params[:stripeToken], customer_id: customer.id)
  @ticket.save

  redirect_to "/", notice: 'Thank you! Watch for an email from us.'

rescue Stripe::CardError => e
  flash[:error] = e.message
  render action: :new
  end
end
