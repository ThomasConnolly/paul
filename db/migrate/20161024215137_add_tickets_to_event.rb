class AddTicketsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :ticket_quantity, :integer
    add_column :events, :tickets_sold, :integer
    add_column :events, :tickets_available, :integer
    remove_column :events, :quantity, :integer
    remove_column :events, :amount, :integer
  end
end
