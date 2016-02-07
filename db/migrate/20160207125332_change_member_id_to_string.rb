class ChangeMemberIdToString < ActiveRecord::Migration
   def change
    add_column :members, :membership_id, :string
    add_column :members, :full_name, :string
  end
end