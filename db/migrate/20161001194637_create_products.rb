class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :type

      t.timestamps null: false
    end
  end
end
