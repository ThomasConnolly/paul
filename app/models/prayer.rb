class Prayer < ActiveRecord::Base
  before_create :honey_must_be_empty

  private
  def honey_must_be_empty
    self.honey==" "
  end
end

