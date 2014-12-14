class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.date :delivered_on
      t.integer :homilist
      t.string :title
      t.string :cites
      t.text :sermon_body

      t.timestamps
    end
  end
end
