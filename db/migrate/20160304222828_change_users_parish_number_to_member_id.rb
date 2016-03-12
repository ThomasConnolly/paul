class ChangeUsersParishNumberToMemberId < ActiveRecord::Migration
  def change
    add_column :users, :member_id, :integer
    remove_column :users, :ParishNumber, :string    
  end
end
