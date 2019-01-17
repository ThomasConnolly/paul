class ChangeUserStripePledgeToSubscription < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :stripe_pledge_id, :string
    add_column :users, :subscription_id, :string
  end
end
