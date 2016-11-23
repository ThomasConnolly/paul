class CreateJubileePlans < ActiveRecord::Migration
  def change
    create_table :jubilee_plans do |t|
      t.string :title
      t.text :body
      t.string :user_name

      t.timestamps null: false
    end
  end
end
