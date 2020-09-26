# == Schema Information
#
# Table name: stripe_reports
#
#  id          :bigint           not null, primary key
#  amount      :integer
#  fee         :integer
#  net         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  donation_id :bigint
#  pledge_id   :bigint
#  user_id     :bigint           not null
#
# Indexes
#
#  index_stripe_reports_on_donation_id  (donation_id)
#  index_stripe_reports_on_pledge_id    (pledge_id)
#  index_stripe_reports_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (donation_id => donations.id)
#  fk_rails_...  (pledge_id => pledges.id)
#  fk_rails_...  (user_id => users.id)
#
class StripeReport < ApplicationRecord
  belongs_to :user
  belongs_to :pledge, optional: true
  belongs_to :donation, optional: true
  before_save :calculate_fee
  before_save :calculate_net

  


  def calculate_fee
    fee_value = ((self.amount * 0.029)+30).round
    self.fee = fee_value
  end

  def calculate_net
    self.net = self.amount - self.fee
  end
end
