class ChangePledgeProductToPlanId < ActiveRecord::Migration[6.0]
  def change
    rename_column :pledges, :product, :plan_id
    rename_column :pledges, :subscription_id, :stripe_id
  end
end
