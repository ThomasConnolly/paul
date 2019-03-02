class Ticket < ApplicationRecord
  belongs_to :event
  before_save :set_amount
  after_update :email_buyer
#honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true

  default_scope -> { order('last_name') }

  def set_amount
    self.amount = self.quantity * self.price
  end

  private

  def email_buyer
    TicketMailer.thanks(self).deliver
  end
end
