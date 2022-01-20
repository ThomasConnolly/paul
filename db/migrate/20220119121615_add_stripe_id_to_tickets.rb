class AddStripeIdToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :stripe_id, :string
  end
end
