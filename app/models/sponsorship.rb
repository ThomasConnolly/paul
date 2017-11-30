class Sponsorship < ApplicationRecord
	belongs_to :user
	validates :amount, :presence => true, :numericality => {:greater_than => 0}
	validates_presence_of :user_id

  before_save :set_divisor
  before_save :set_pay_this

  def set_divisor
    if self.plan == "monthly"
      puts self.divisor = 12
    elseif self.plan == "quarterly"
      puts self.divisor = 4
    else
      puts self.divisor = 1
    end
  end

  def set_pay_this
  	self.pay_this = self.amount*100 / self.divisor.to_i
  end

  
end


