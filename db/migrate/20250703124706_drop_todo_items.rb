class DropTodoItems < ActiveRecord::Migration[8.0]
  def change
    drop_table :todo_items if table_exists?(:todo_items)
  end
end
