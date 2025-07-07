class DropAlbergueDonations < ActiveRecord::Migration[8.0]
  def change
    drop_table :albergue_donations do |t|
      t.string :donor_name
      t.string :donor_email
      t.decimal :amount, precision: 10, scale: 2
      t.text :message
      t.references :albergue, foreign_key: true

      t.timestamps
    end
  end
end
