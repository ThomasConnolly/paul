class Characteristic < ApplicationRecord
  
  has_many :ratings, inverse_of: :characteristic
  accepts_nested_attributes_for :ratings
  has_many :search_questions
  belongs_to :user
  accepts_nested_attributes_for :ratings
  
  validates_presence_of :name
  validates_presence_of :definition
 
end
