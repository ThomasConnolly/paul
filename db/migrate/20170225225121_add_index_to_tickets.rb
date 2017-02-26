class AddIndexToTickets < ActiveRecord::Migration
  def change
    add_index :tickets, :event_id
  end
end
