class RenameChildrenToAlbergueChildren < ActiveRecord::Migration[6.0]
  def change
    rename_table :children, :albergue_children
  end
end
