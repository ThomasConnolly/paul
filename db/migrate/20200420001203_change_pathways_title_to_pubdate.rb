class ChangePathwaysTitleToPubdate < ActiveRecord::Migration[6.0]
  def change
    rename_column :pathways, :title, :pubdate
  end
end
