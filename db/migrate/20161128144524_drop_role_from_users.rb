class DropRoleFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :role, :integer
    remove_column :users, :communicator, :boolean
    remove_column :users, :jubilee, :boolean
  end
end
