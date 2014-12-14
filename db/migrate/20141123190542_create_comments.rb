class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :post
      t.string :author

      t.timestamps
    end
  end
end
