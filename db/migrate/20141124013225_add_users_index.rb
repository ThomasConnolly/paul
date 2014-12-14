class AddUsersIndex < ActiveRecord::Migration
  def change
    add_index :users, :full_name
  end
end
