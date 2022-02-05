class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default_value: 0
  end
end
