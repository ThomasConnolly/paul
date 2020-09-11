class RemoveStartDateFromPledges < ActiveRecord::Migration[6.0]
  def change
    remove_column :pledges, :start_date
    remove_column :pledges, :end_date
    add_column :pledges, :dollars, :integer
  end
end
