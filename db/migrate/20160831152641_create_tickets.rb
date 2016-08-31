class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :event
      t.date :date
      t.decimal :price
      t.timestamps null: false
    end
  end
end
