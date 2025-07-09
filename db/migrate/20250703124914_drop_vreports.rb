class DropVreports < ActiveRecord::Migration[8.0]
  def change
    drop_table :vreports if table_exists?(:vreports)
  end
end
