class DropTasks < ActiveRecord::Migration[8.0]
  def change
    drop_table :tasks if table_exists?(:tasks)
  end
end
