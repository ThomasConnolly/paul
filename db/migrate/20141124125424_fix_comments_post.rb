class FixCommentsPost < ActiveRecord::Migration
  def change
    add_column :comments, :post_id, :integer
    remove_column :comments, :post, :integer
  end
end
