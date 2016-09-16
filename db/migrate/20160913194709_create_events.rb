class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :price
      t.date :date

      t.timestamps null: false
    end
  end
end
