class ReviseDonationsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :donations, :pay_this, :integer
    remove_column :donations, :name, :string
    remove_column :donations, :address, :string
    remove_column :donations, :city, :string
    remove_column :donations, :zip, :string
    remove_column :donations, :source, :string
    remove_column :donations, :customer_id,
     :string
    remove_column :donations, :amount, :integer
    add_column :donations, :plan, :string
    add_column :donations, :stripe_plan, :string

  end
end
