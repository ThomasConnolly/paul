# frozen_string_literal: true

# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  amount      :integer
#  email       :string
#  first_name  :string
#  honey       :string
#  last_name   :string
#  price       :decimal(, )
#  quantity    :integer
#  source      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :string
#  event_id    :integer
#
# Indexes
#
#  index_tickets_on_event_id  (event_id)
#
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
