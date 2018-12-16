class CreatePledgers < ActiveRecord::Migration[5.2]
  def change
    create_table :pledgers do |t|
      t.string :last_name
      t.string :salutation
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.integer :type
      t.string :northern_city

      t.timestamps
    end
  end
end
