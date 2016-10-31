class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
    @event = Event.find(params[:event_id])
  end

  def new
    @ticket = Ticket.new
    @event = Event.find(params[:event_id])
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.event_id = params[:event_id]
    if @ticket.save
      redirect_to [@ticket.event, @ticket], notice: "ticket created"
    else
      render "new"
    end
  end


  private

    def ticket_params
    params.require(:ticket).permit(:event_id, :email, :customer_id, :quantity, :amount, :price)
  end
end
