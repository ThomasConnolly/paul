class VoteOption < ActiveRecord::Base
  validates :question, presence: true
end