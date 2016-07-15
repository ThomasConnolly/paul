class RemoveAnniversaryFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :anniversary, :date
  end
end
