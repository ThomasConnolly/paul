class CreateSearchTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :search_tasks do |t|
      t.string :title
      t.text :body
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
