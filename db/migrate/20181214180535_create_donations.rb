class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :user, foreign_key: true
      t.integer :amount, default: 275
      t.integer :pay_this
      t.boolean :anonymous, null: false, default: false
      t.timestamps
    end
  end
end
