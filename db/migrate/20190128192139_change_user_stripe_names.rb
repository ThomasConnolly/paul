class ChangeUserStripeNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :customer_id, :stripe_customer_id
    rename_column :users, :stripe_sponsorship_id, :albergue_sponsor
    rename_column :users, :subscription_id, :stripe_pledge
  end
end
