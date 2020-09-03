class CreateStripeReports < ActiveRecord::Migration[6.0]
  def change
    create_table :stripe_reports do |t|
      t.string :date
      t.integer :amount
      t.integer :fee
      t.integer :net
      t.references :pledge, foreign_key: true
      t.references :donation, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
