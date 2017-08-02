class Meditation < ApplicationRecord
  validates_presence_of :name, :title, :scripture, :prayer, :body

  #honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true

  default_scope -> { order('publish_on ASC') }

end
