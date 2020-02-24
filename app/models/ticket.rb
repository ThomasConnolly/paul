# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :event
  before_save :set_amount
  after_update :email_buyer
  # honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true
  validates :quantity, presence: true

  def set_amount
    self.amount = quantity * price 
  end

  private

  def email_buyer
    TicketMailer.thanks(self).deliver
  end
end
