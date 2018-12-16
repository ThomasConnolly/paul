class Donation < ApplicationRecord
  belongs_to :user
  before_save :set_pay_this



  def set_pay_this
    self.pay_this = self.amount*100
  end
end
