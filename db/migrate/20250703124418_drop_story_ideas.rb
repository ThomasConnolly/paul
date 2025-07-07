class DropStoryIdeas < ActiveRecord::Migration[8.0]
  def change
    drop_table :story_ideas do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
