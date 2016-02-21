class DropBirthdayAnnivFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :birthday, :date
    remove_column :users, :anniversary, :date
  end
end
