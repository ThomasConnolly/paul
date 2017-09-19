class AddCardAndCustomerToPledge < ActiveRecord::Migration[5.1]
  def change
    add_column :pledges, :card, :string
    add_column :pledges, :customer_id, :string
  end
end
