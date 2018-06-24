class Candidate < ApplicationRecord
  
  has_many :comments, as: :commentable, dependent: :destroy
  validates_presence_of :last_name
  validates_presence_of :full_name

end
