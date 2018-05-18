class Candidate < ApplicationRecord
  validates_presence_of :last_name
  validates_presence_of :full_name
  validates_presence_of :url
end
