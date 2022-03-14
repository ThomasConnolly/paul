class StoryAssignment < ApplicationRecord
  belongs_to :story_idea
  enum :status, [ :pending, :submitted ]
end
