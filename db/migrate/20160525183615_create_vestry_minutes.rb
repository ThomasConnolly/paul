class CreateVestryMinutes < ActiveRecord::Migration
  def change
    create_table :vestry_minutes do |t|
      t.date :date
      t.text :minutes

      t.timestamps null: false
    end
  end
end
