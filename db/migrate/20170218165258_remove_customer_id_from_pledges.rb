class RemoveCustomerIdFromPledges < ActiveRecord::Migration
  def change
    remove_column :pledges, :customer_id, :integer
  end
end
