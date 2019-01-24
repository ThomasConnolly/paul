class ChangeFullNameToUsernameInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :full_name, :username
  end
end
