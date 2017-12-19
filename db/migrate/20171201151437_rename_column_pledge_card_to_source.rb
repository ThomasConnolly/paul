class RenameColumnPledgeCardToSource < ActiveRecord::Migration[5.1]
  def change
  	rename_column :pledges, :card, :source
  end
end
