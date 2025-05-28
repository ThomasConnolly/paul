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
  validates :stripe_fee, presence: true
  validates :net, presence: true
end
