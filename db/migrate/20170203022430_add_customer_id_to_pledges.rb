class AddCustomerIdToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :customer_id, :string
  end
end
