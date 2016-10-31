# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  divisor    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  amount     :decimal(15, 2)
#  pay_this   :decimal(15, 2)
#

class Pledge < ActiveRecord::Base
  belongs_to :user
  validates :amount, :presence => true, :numericality => {:greater_than => 0}
  validates :divisor, :presence => true, :numericality => {:greater_than => 0}
  validates_presence_of :user_id
  before_save :set_pay_this
  

 
  def set_pay_this
    self.pay_this = self.amount / self.divisor
  end
end
