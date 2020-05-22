# frozen_string_literal: true

# == Schema Information
#
# Table name: pledges
#
#  id             :integer          not null, primary key
#  amount         :integer
#  divisor        :integer
#  end_date       :date
#  interval       :string
#  interval_count :integer
#  pay_this       :integer
#  plan           :string
#  start_date     :date
#  status         :integer
#  created_at     :datetime
#  updated_at     :datetime
#  plan_id        :string           default("prod_ETteQ8s9Ho9sNW")
#  stripe_id      :string
#  user_id        :integer
#

class Pledge < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :divisor, presence: true, numericality: { greater_than: 0 }
  validates_presence_of :user_id
  before_save :set_pay_this
  before_save :set_plan
  before_save :set_interval
  before_save :set_interval_count
  belongs_to :subscriptions
  before_destroy :update_user

  enum status: { inactive: 0, active: 1, cancelled: 2 }
  enum interval: { week: 0, month: 1 }

  # Amount in whole dollars now translated to pennies. Payment at specified intervals (divisor) calculated.

  def set_pay_this
    self.pay_this = amount * 100 / divisor
  end

  def set_plan
    if divisor == 4
      puts self.plan = 'quarterly'
    elsif divisor == 12
      puts self.plan = 'monthly'
    else
      puts self.plan = 'weekly'
    end
  end

  def set_interval
    if divisor == 52
      puts self.interval = 0
    else
      puts self.interval = 1
    end
  end

  def set_interval_count
    if divisor == 4
      puts self.interval_count = 3
    elsif interval_count == 12
      puts self.interval_count = 1
    else
      puts self.interval_count = 1
    end
  end
end
