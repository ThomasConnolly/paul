class DropTablePayments < ActiveRecord::Migration[6.0]
    def up
      drop_table :payments
    end
  
    def down
      create_table :payments do |t|
        t.string "stripe_id"
        t.datetime "created_at", precision: 6, null: false
        t.datetime "updated_at", precision: 6, null: false
        t.string "card_brand"
        t.string "card_last4"
        t.string "card_exp_month"
        t.string "card_exp_year"

    end
  end
end
