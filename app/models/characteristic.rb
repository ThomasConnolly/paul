class Characteristic < ApplicationRecord
  belongs_to :user
  has_many :search_questions

  validates_presence_of :name
  validates_presence_of :definition
 
end
