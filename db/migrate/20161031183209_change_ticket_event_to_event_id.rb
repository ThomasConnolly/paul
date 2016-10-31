class ChangeTicketEventToEventId < ActiveRecord::Migration
  def change
    remove_column :tickets, :event, :string
    add_column :tickets, :event_id, :integer
    add_column :tickets, :quantity, :integer
    add_column :tickets, :amount, :integer

  end
end

