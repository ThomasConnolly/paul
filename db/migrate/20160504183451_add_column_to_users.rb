class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :communicator, :boolean
  end
end
