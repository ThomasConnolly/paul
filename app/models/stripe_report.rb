# typed: false
# frozen_string_literal: true

# == Schema Information
#
# Table name: stripe_reports
#
#  id                :bigint           not null, primary key
#  amount            :integer
#  fee               :integer
#  net               :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  date_paid         :date
#  donor_name        :string
#  payment_intent_id :string
#

class StripeReport < ApplicationRecord
  validates :amount, presence: true
  validates :payment_intent_id, presence: true, uniqueness: true
  before_save :calculate_fee
  before_save :calculate_net

  def calculate_fee
    fee_value = ((amount * 0.029) + 30).round
    self.fee = fee_value
  end

  def calculate_net
    self.net = amount - fee
  end
end
