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
#

class Pledge < ActiveRecord::Base
  belongs_to :user
  validates :amount, :presence => true, :numericality => {:greater_than => 0}
  validates :divisor, :presence => true, :numericality => {:greater_than => 0}
  validates_presence_of :user_id
  before_save :set_pay_this


 
  def set_pay_this
    self.pay_this = self.amount.to_i / self.divisor * 100
  end

end
