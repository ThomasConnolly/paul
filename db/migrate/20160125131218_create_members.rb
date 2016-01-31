class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.date :anniversary
      t.date :birthday

      t.timestamps null: false
    end
  end
end
