class CreateHomilists < ActiveRecord::Migration
  def change
    create_table :homilists do |t|
      t.string :name
      t.string :title
      t.string :photo

      t.timestamps
    end
  end
end
