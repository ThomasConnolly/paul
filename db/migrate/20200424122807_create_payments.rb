class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :donations, null: false, foreign_key: true
      t.integer :amount
      t.string :card_id
      t.string :stripe_id

      t.timestamps
    end
  end
end
