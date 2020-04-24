class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :donation, null: false, foreign_key: true
      t.string :card_brand
      t.string :card_last4
      t.string :card_exp_month
      t.string :card_exp_year
      t.string :stripe_id

      t.timestamps
    end
  end
end
