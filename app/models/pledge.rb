# typed: false
# frozen_string_literal: true

# Table name: pledges
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#  amount          :integer
#  interval            :string
#  subscription_id :string
#  price_id         :string           default("prod_ETteQ8s9Ho9sNW")
#  status          :string
#  dollars         :integer
#

class Pledge < ApplicationRecord
  belongs_to :user
  validates :dollars, presence: true, numericality: { only_integer: true }
  validates :price_id, presence: true
  validates :interval, presence: true,
                       inclusion: { in: %w[weekly monthly quarterly] }
  before_save :set_price_id
  before_destroy :cancel_stripe_subscription, if: :subscription_id

  def set_price_id
    self.price_id = case interval
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
    return if subscription_id.blank?

    begin
      Stripe::Subscription.cancel(subscription_id)
    rescue Stripe::StripeError => e
      Rails.logger.error "Failed to cancel subscription #{subscription_id}: #{e.message}"
      # Don't raise error to allow record deletion to continue
    end
  end
end
