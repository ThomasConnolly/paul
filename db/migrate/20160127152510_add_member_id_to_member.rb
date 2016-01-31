class AddMemberIdToMember < ActiveRecord::Migration
  def change
    add_column :members, :member_id, :integer
  end
end
