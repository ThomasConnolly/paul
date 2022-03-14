class CreateStoryAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :story_assignments do |t|
      t.references :story_idea, null: false, foreign_key: true
      t.integer :assigned_to
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
