class AddEmailToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :email, :string
    add_column :tickets, :customer_id, :string
    add_column :tickets, :card, :string
  end
end
