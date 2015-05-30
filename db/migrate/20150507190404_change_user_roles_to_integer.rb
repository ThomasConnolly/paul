class ChangeUserRolesToInteger < ActiveRecord::Migration
  def change
    change_column :users, :role, 'integer USING CAST(Role AS integer)'
    
  end
end
