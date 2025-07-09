class DropStoryIdeas < ActiveRecord::Migration[8.0]
  def change
    drop_table :story_ideas
  end
end
