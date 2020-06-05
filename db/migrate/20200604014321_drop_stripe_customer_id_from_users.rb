class DropStripeCustomerIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :stripe_customer_id
  end
end
