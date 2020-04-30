class ChangePaymentsColumnNames < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments, :card_id, :string
    remove_column :payments, :amount, :integer
    add_column :payments, :card_brand, :string
    add_column :payments, :card_last4, :string
    add_column :payments, :card_exp_month, :string
    add_column :payments, :card_exp_year, :string
  end
end
