class AddHoneyToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :honey, :string
  end
end
