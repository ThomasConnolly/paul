class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.string :buyer
      t.integer :quantity
      t.integer :amount

      t.timestamps null: false
    end
  end
end
