class ChangeColumnNamesAtPledges < ActiveRecord::Migration[6.0]
  def change
    remove_column :pledges, :interval_count
    remove_column :pledges, :interval
    remove_column :pledges, :pay_this
    remove_column :pledges, :divisor
    remove_column :pledges, :status
    add_column :pledges, :active, :boolean, default: true
  end
end
