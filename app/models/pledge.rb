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
  validates_presence_of :amount, numericality: true
  validates_presence_of :divisor
  validates_presence_of :user_id

  before_save :set_pay_this


  def set_pay_this
    self.pay_this = self.amount.to_f*100 / self.divisor
  end

end
