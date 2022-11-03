class StoryAssignment < ApplicationRecord
  belongs_to :story_idea
  enum :status, %i[pending submitted]
end
