class CreateStoryIdeas < ActiveRecord::Migration
  def change
    create_table :story_ideas do |t|
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
