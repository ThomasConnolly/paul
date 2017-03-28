class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
      t.string :day_of_prayer
      t.string :time_of_prayer 
      t.string :name
      t.string :honey, default: nil

      t.timestamps null: false
    end
  end
end
