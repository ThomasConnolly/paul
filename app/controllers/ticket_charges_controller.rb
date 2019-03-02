class TicketChargesController < ApplicationController

  def new
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @amount = @ticket.amount

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => @ticket.event.title,
    :currency    => 'usd'
  )

    @ticket.update(email: params[:stripeEmail],
    source: params[:stripeToken], customer_id: customer.id)
    @ticket.save
    redirect_to root_path, notice: "Thank you!"

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
    end
  end
