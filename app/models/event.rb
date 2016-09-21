class Event < ActiveRecord::Base
  before_save :set_amount


  def set_amount
    self.amount = self.price * self.quantity
  end
end
