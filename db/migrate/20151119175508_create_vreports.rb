class CreateVreports < ActiveRecord::Migration
  def change
    create_table :vreports do |t|
      t.string :title
      t.references :user
      t.text :body

      t.timestamps null: false
    end
  end
end
