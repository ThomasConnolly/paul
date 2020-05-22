class ChangeDonationStripeIntentToStripeCustomer < ActiveRecord::Migration[6.0]
  def change
    rename_column :donations, :stripe_intent, :stripe_customer
  end
end
