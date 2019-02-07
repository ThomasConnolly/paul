class RemoveStripePlanFromAlberbueDonations < ActiveRecord::Migration[5.2]
  def change
    remove_column :albergue_donations, :stripe_plan, :string
  end
end
