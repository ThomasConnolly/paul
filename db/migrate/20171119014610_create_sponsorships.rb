class CreateSponsorships < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsorships do |t|
      t.integer :user_id
      t.integer :amount
      t.string :plan
      t.string :customer_id
      t.string :card
      t.integer :last_4
      t.date :expiraton_date

      t.timestamps
    end
  end
end
