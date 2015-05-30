class Pledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :amount
      t.integer :divisor
      t.integer :pay_this
      t.integer :user_id

      t.timestamps
    end
  end
end
