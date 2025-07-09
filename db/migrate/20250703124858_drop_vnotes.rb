class DropVnotes < ActiveRecord::Migration[8.0]
  def change
    drop_table :vnotes if table_exists?(:vnotes)
  end
end
