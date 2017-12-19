# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  divisor    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  amount     :integer
#  pay_this   :integer
#

class Pledge < ApplicationRecord
  belongs_to :user
  validates :amount, :presence => true, :numericality => {:greater_than => 0}
  validates :divisor, :presence => true, :numericality => {:greater_than => 0}
  validates_presence_of :user_id
  before_save :set_pay_this
  before_save :set_plan


  

 #Amount in whole dollars now translated to pennies. Payment at specified intervals (divisor) calculated.



  def set_pay_this
    self.pay_this = self.amount*100 / self.divisor
  end

  def set_plan
    if self.divisor == 4
      puts self.plan = "quarterlyPledge"
    elsif self.divisor == 12
      puts self.plan = "monthlyPledge"
    else
      puts self.plan = "weeklyPledge"
    end
  end
end
