class ChangeTicketsSourceToCheckout < ActiveRecord::Migration[6.1]
  def change
    rename_
    column :tickets, :source, :checkout
  end
end
