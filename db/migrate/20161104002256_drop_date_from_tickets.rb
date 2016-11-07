class DropDateFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :date, :date
  end
end
