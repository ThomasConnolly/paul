# frozen_string_literal: true

# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  amount     :integer
#  dollars    :integer
#  plan       :string
#  status     :string
#  created_at :datetime
#  updated_at :datetime
#  plan_id    :string           default("prod_ETteQ8s9Ho9sNW")
#  stripe_id  :string
#  user_id    :integer
#

class Pledge < ApplicationRecord
  belongs_to :user
  validates :dollars, presence: true
  validates_presence_of :user_id
  validates_presence_of :plan_id
  before_save :set_plan_id
  before_destroy :cancel_stripe_subscription, if: :stripe_id

  
  def set_plan_id
    if Rails.env.production?
      self.plan_id = 'plan_HGF5TFwu6CExEc' if plan == "quarterly"
      self.plan_id = 'plan_HGF3HFRRZXQ1vS' if plan == "monthly"
      self.plan_id = 'plan_HGF4nSEWQx4NPv'  if plan == "weekly"
    elsif Rails.env.development?
      self.plan_id = 'plan_HCxxRCehGf5Pog' if plan == "quarterly"
      self.plan_id = 'plan_HCxus7BSYo1eSh' if plan == "monthly"
      self.plan_id = 'plan_HCxvLz92uVgU3a'  if plan == "weekly"
    end
  end

  def cancel_stripe_subscription
    subscription = Stripe::Subscription.retrieve(self.stripe_id).delete
    self.stripe_id = nil
  end
end
