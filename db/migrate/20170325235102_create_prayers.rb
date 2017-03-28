class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
      t.string :date
      t.string :time
      t.string :name
      t.string :honey, default: nil

      t.timestamps null: false
    end
  end
end
