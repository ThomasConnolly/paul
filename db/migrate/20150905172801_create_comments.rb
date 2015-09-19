class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body
      t.references :user
      t.references :post
      t.timestamps
    end
    add_index :comments, :post_id
    add_index :comments, :user_id
  end

  def self.down
    drop_table :comments
  end
end
