class RemoveStripeDataFromPledges < ActiveRecord::Migration[5.1]
  def change
    remove_column :pledges, :source, :string
    remove_column :pledges, :customer_id, :string
  end
end
