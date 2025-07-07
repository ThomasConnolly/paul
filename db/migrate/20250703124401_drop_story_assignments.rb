class DropStoryAssignments < ActiveRecord::Migration[8.0]
  def change
    drop_table :story_assignments do |t|
      t.references :story, foreign_key: true
      t.references :user, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
