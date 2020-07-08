class AddYdayToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :yday, :integer
  end
end
