class Meditation < ApplicationRecord
  validates_presence_of :name, :title, :scripture, :prayer, :body

  #honey used to prevent bots-filled forms from being saved to db
  before_validation :honey_must_be_empty



  default_scope -> { order('publish_on ASC') }

private
  def honey_must_be_empty
    self.honey == ""
  end
end
