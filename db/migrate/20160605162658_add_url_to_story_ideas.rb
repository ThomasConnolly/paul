class AddUrlToStoryIdeas < ActiveRecord::Migration
  def change
    add_column :story_ideas, :url, :string
  end
end
