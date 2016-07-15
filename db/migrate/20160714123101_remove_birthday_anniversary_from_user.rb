class RemoveBirthdayAnniversaryFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :anniversary, :date
    remove_column :users, :birthday, :date
  end
end
