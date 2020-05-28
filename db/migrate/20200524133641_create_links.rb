class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :event
      t.string :time
      t.datetime :date
      t.string :url

      t.timestamps
    end
  end
end
