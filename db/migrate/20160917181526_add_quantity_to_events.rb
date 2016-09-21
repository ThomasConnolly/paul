class AddQuantityToEvents < ActiveRecord::Migration
  def change
    add_column :events, :quantity, :integer
    add_column :events, :amount, :integer
  end
end
