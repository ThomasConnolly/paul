class Sponsorship < ApplicationRecord
	belongs_to :user
	validates :amount, :presence => true, :numericality => {:greater_than => 0}
	validates_presence_of :user_id
  before_save :set_pay_this
  before_save :set_plan

# change user input to cents from dollars
  def set_pay_this
  	self.pay_this = self.amount*100 / self.divisor
  end

  def set_plan
  	if self.divisor == 12
  		puts self.plan = "monthly"
  	elsif self.divisor == 4
  		puts self.plan = "quarterly"
  	else
  		puts self.plan = "full"
  	end
  end
end
