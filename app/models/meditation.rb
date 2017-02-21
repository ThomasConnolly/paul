class Meditation < ActiveRecord::Base
  validates_presence_of [:name, :title, :scripture, :prayer, :body]
  before_validation :honey_must_be_nil

private
  def honey_must_be_nil
    self.honey == ""
  end
end
