class AddNameToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :first_name, :string
    add_column :tickets, :last_name, :string
  end
end
