class CreateDrop5s < ActiveRecord::Migration[5.1]
  def change
    create_table :drop5s do |t|
      t.integer :pledge
      t.string :name
      t.text :how
      t.string :honey

      t.timestamps
    end
  end
end
