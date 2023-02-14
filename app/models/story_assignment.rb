class StoryAssignment < ApplicationRecord
  belongs_to :story_idea, dependent: :destroy
  enum :status, %i[pending submitted]
end
