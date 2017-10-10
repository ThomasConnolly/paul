class TicketMailer < ApplicationMailer
  
  def ticket_receipt ticket
    @ticket = ticket 
    mail to: ticket.email, subject: "Thank you"
  end

end
