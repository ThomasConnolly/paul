# typed: false
# frozen_string_literal: true

# == Schema Information
#
# Table name: stripe_reports
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  stripe_fee :integer
#  net        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  donor_name :string
#  webhook_id :integer
#

class StripeReport < ApplicationRecord
  validates :donor_name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :webhook_id, presence: true
  validates :stripe_fee, presence: true,
                         numericality: { greater_than_or_equal_to: 0 }
  validates :net, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :payment_method_type, presence: true
  # private

  # def send_stripe_mail
  #   StripeMailer.stripe_report(self).deliver_now
  # end
end
