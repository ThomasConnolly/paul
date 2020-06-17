class ChangeDonationStripeCustomerToStripeId < ActiveRecord::Migration[6.0]
  def change
    rename_column :donations, :stripe_customer, :stripe_id
  end
end
