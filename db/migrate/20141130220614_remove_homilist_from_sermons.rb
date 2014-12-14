class RemoveHomilistFromSermons < ActiveRecord::Migration
  def change
    remove_column :sermons, :homilist, :integer
    add_column :sermons, :homilist_id, :integer
  end
end
