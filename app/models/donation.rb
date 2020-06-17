# == Schema Information
#
# Table name: donations
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  dollars    :integer
#  status     :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stripe_id  :string
#  user_id    :bigint
#
# Indexes
#
#  index_donations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Donation < ApplicationRecord
  belongs_to :user
  validates_presence_of :dollars
  before_save :set_amount
  before_destroy :cancel_stripe

  
  
  def set_amount
    self.amount = self.dollars.to_i * 100
    amount
  end

  def cancel_stripe
    Stripe::Subscription.delete(stripe_id)
  end
end
