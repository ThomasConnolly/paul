class DropTableSearchTasks < ActiveRecord::Migration[5.2]
  def change
    drop_table :search_tasks
  end
end
