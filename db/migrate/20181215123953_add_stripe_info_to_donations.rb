class AddStripeInfoToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :stripe_email, :string
    add_column :donations, :customer_id, :string
  end
end
