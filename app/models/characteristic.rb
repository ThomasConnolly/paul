class Characteristic < ApplicationRecord
  belongs_to :user
  has_many :definitions
  has_many :formulate_questions
  has_many :ratings
end
