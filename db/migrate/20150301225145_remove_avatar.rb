class RemoveAvatar < ActiveRecord::Migration
  def change
    remove_column :posts, :picture, :string
    remove_column :users, :avatar, :string
  end
end
