class Pathway < ApplicationRecord
  validates_presence_of :link
  validates_presence_of :image
  validates_presence_of :pubdate
end
