class AddAssignedToStoryIdea < ActiveRecord::Migration[7.0]
  def change
    add_column :story_ideas, :assigned_to, :integer
    add_column :story_ideas, :status, :integer
  end
end
