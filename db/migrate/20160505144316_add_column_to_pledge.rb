class AddColumnToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :pennies, :integer
  end
end
