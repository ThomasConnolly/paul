class DropStoryAssignments < ActiveRecord::Migration[8.0]
  def change
    drop_table :story_assignments
  end
end
