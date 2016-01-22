class AddBirthdayAndAnniversaryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_column :users, :anniversary, :date
  end
end
