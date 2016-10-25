class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end
  
  def show
    @ticket = Ticket.find(params[:id])
  end







  private

    def ticket_params
    params.require(:ticket).permit(:event_id, :buyer, :quantity, :amount)
  end
end
