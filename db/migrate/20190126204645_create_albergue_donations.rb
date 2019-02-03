class CreateAlbergueDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :albergue_donations do |t|
      t.references :user, foreign_key: true
      t.string :plan
      t.string :stripe_plan
      t.boolean :anonymous, default: false

      t.timestamps
    end
  end
end
