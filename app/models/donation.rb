# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#  stripe_id  :string
#  amount     :integer
#  dollars    :integer
#  status     :string
#  memo       :string
#
# Indexes
#
#  index_donations_on_user_id  (user_id)
#

class Donation < ApplicationRecord
  belongs_to :user
  validates_presence_of :dollars, numericality: { only_integer: true }
  before_save :set_amount
  before_save :set_stripe_id
  
  def set_amount
    self.amount = self.dollars.to_i * 100
    amount
  end

  def set_stripe_id
    price = Stripe::Price.create({
      unit_amount: self.amount,
      currency: 'usd',
      product: 'prod_ETteQ8s9Ho9sNW',
    })
    self.stripe_id = price.id
  end    
end
