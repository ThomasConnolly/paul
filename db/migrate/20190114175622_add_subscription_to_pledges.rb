class AddSubscriptionToPledges < ActiveRecord::Migration[5.2]
  def change
    add_column :pledges, :subscription_id, :string
    add_column :pledges, :interval, :integer
    add_column :pledges, :interval_count, :integer
    add_column :pledges, :status, :integer
  end
end
