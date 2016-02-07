class DropMemberIdFromMembers < ActiveRecord::Migration
  def change
  
    remove_column :members, :member_id, :integer
  end
end