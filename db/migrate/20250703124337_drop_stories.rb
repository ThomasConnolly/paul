class DropStories < ActiveRecord::Migration[8.0]
  def change
    drop_table :stories
  end
end
