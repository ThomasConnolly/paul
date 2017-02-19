class AddCustomerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :customer_id, :string
    add_column :users, :card, :string
  end
end
