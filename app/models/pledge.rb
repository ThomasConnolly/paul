# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  amount     :integer
#  divisor    :integer
#  pay_this   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  pennies    :integer
#

class Pledge < ActiveRecord::Base
  belongs_to :user
  validates :amount, :presence => true, :numericality => {:greater_than => 0}
  validates :divisor, :presence => true, :numericality => {:greater_than => 0}
  validates_presence_of :user_id
  before_save :set_pay_this
  after_save :set_pennies

 
  def set_pay_this
    self.pay_this = self.amount / self.divisor
  end

  def set_pennies
    self.update_column(:pennies, self.pay_this * 100)
  end
end
