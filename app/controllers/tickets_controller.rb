class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_event
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
    if params[:event_id]
      @tickets = Event.find(params[:event_id]).tickets
    else
      @tickets = Ticket.all
    end
  end

  def new
    @ticket = @event.tickets.build
  end

  def create
    @ticket = @event.tickets.build(ticket_params)
    if @ticket.save
      redirect_to [@event, @ticket], notice: "ticket created"
    else
      render "new"
    end
  end

  def update
  end

  private

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_ticket
      @ticket = @event.tickets.find(params[:id])
    end



    def ticket_params
    params.require(:ticket).permit(:event_id, :email, :customer_id, :quantity, :amount, :price,
      :first_name, :last_name, :source, :honey)
  end
end
