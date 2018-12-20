class CreateLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :letters do |t|
      t.string :salutation
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :writer

      t.timestamps
    end
  end
end
