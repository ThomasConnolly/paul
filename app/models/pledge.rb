# == Schema Information
#
# Table name: pledges
#
#  id              :integer          not null, primary key
#  divisor         :integer
#  user_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#  amount          :integer
#  pay_this        :integer
#  plan            :string
#  subscription_id :string
#  interval        :integer
#  interval_count  :integer
#  status          :integer
#  start_date      :date
#  end_date        :date
#

class Pledge < ApplicationRecord
  belongs_to :user
  validates :amount, :presence => true, :numericality => {:greater_than => 0}
  validates :divisor, :presence => true, :numericality => {:greater_than => 0}
  validates_presence_of :user_id
  before_save :set_pay_this
  before_save :set_plan
  before_save :set_interval
  before_save :set_interval_count
  before_destroy :kill_stripe_subscription
  before_destroy :update_user

  enum status: {inactive: 0, active: 1, cancelled: 2}
  enum interval: {week: 0, month: 1}


 #Amount in whole dollars now translated to pennies. Payment at specified intervals (divisor) calculated.

  def set_pay_this
    self.pay_this = self.amount*100 / self.divisor
  end

  def set_plan
    if self.divisor == 4
      puts self.plan = "quarterly"
    elsif self.divisor == 12
      puts self.plan = "monthly"
    else
      puts self.plan = "weekly"
    end
  end

  def set_interval
    if self.divisor == 52
      puts self.interval = 0
    else
      puts self.interval = 1
    end
  end

  def set_interval_count
    if self.divisor == 4
      puts self.interval_count = 3
    elsif self.interval_count == 12
      puts self.interval_count = 1
    else
      puts self.interval_count = 1
    end
  end

  def kill_stripe_subscription
    # if self.subscription_id?
    #   su = Stripe::Subscription.retrieve(self.subscription_id)
    #     su.delete
        self.subscription_id = nil
        self.status = 2
    end

  def update_user
    self.user.stripe_pledge = nil

  end
end
