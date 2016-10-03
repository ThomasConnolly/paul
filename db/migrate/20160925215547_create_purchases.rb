class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :email
      t.integer :amount
      t.string :description
      t.string :currency
      t.string  :card
      t.integer :customer_id
      t.integer :pledge_id
      t.integer :event_id


      t.timestamps null: false
    end
  end
end
