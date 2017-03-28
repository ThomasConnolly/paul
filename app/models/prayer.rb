class Prayer < ActiveRecord::Base
  validates_presence_of [:date, :time]
  before_validation :honey_must_be_empty

  private
  def honey_must_be_empty
    self.honey == ""
  end
end

