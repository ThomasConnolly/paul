class Work < ApplicationRecord
  validates_presence_of :my_act
  #honey used to prevent bots-filled forms from being saved to db
  validates :honey, length: { is: 0 }
end
