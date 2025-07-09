class DropTodoLists < ActiveRecord::Migration[8.0]
  def change
    drop_table :todo_lists if table_exists?(:todo_lists)
  end
end
