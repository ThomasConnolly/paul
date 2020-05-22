class ChargesController < ApplicationController


  def new; end

  def create
    @ticket = Ticket.find(params[:ticket_id])
  

  end
end

