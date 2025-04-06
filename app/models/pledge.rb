# typed: false
# frozen_string_literal: true

# Table name: pledges
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#  amount          :integer
#  price            :string
#  subscription_id :string
#  price_id         :string           default("prod_ETteQ8s9Ho9sNW")
#  status          :string
#  dollars         :integer
#

class Pledge < ApplicationRecord
  belongs_to :user
  validates :dollars, presence: true, numericality: { only_integer: true }
  validates :price_id, presence: true
  before_save :set_price_id
  before_destroy :cancel_stripe_subscription, if: :subscription_id

  def set_price_id
    self.price_id = case price
                    when 'quarterly'
                      if Rails.env.production?
                        'price_1R6AzGHiibShxDkjyx6ULIKu'
                      else
                        'price_1R6i5fHiibShxDkjS8cTL4Gk'
                      end
                    when 'monthly'
                      if Rails.env.production?
                        'price_1R6AySHiibShxDkj3EAphCnD'
                      else
                        'price_1R6i3QHiibShxDkjxqyh59Ot'
                      end
                    when 'weekly'
                      if Rails.env.production?
                        'price_1R6AwqHiibShxDkjp2tBBUl1'
                      else
                        'price_1R6i13HiibShxDkj2Qa4s4OD'
                      end
                    end
  end

  def cancel_stripe_subscription
    Stripe::Subscription.retrieve(subscription_id).delete
    update(status: 'canceled')
  end
end
