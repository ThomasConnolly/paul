# typed: true
# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_event
  before_action :set_ticket, only: %i[show update destroy]

  def index
    @tickets = Ticket.order(:last_name)
    @pd_tickets = Ticket.where(event: @event, checkout: 'paid').order(:last_name)
  end

  def show; end

  def new
    @ticket = @event.tickets.build
  end

  def create
    @ticket = @event.tickets.build(ticket_params)
    if @ticket.save
      redirect_to([@event, @ticket], notice: 'ticket created')
    else
      render('new')
    end
  end

  def update; end

  def destroy
    @ticket.destroy
    redirect_to '/', notice: 'ticket deleted'
  end

  def thanks
    @event = @ticket.event_id
  end

  private

  def set_event
    @event = Event.last
  end

  def set_ticket
    @ticket = @event.tickets.find(params[:id])
  end

  def ticket_params
    params.expect(ticket: %i[price event_id quantity amount first_name last_name
                             email customer_id checkout stripe_id honey])
  end
end
