class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :leader
      t.integer :user_id
      t.string :title
      t.text :bio
      t.string :photo

      t.timestamps null: false
    end
  end
end
