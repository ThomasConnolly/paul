class ChangePostUserToId < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    remove_column :posts, :user
  end
end
