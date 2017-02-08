class CreateMeditations < ActiveRecord::Migration
  def change
    create_table :meditations do |t|
      t.string :title
      t.text :body
      t.string :scripture

      t.timestamps null: false
    end
  end
end
