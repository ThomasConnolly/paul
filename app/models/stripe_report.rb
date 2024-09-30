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
  validates :donor_name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :webhook_id, presence: true
  validates :stripe_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :net, presence: true, numericality: { greater_than_or_equal_to: 0 }
  after_create :send_stripe_mail

  private

  def send_stripe_mail
    StripeMailer.stripe_report(self).deliver_now
  end
end
