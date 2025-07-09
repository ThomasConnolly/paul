class DropThankfuls < ActiveRecord::Migration[8.0]
  def change
    drop_table :thankfuls if table_exists?(:thankfuls)
  end
end
