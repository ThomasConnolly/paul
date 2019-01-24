class ChangeFullNameToUsernameInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :username, :username
  end
end
