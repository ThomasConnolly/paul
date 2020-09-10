class CreateStripeReports < ActiveRecord::Migration[6.0]
  def change
    create_table :stripe_reports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pledge, null: true, foreign_key: true
      t.references :donation, null: true, foreign_key: true
      t.integer :amount
      t.integer :fee
      t.integer :net

      t.timestamps
    end
  end
end
