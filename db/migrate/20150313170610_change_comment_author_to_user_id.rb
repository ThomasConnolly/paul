class ChangeCommentAuthorToUserId < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    remove_column :comments, :author, :string
  end
end
