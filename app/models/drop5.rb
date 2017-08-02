class Drop5 < ApplicationRecord
  validates_presence_of :pledge
  #honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true
end
