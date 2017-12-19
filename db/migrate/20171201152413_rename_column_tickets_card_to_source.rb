class RenameColumnTicketsCardToSource < ActiveRecord::Migration[5.1]
  def change
  	rename_column :tickets, :card, :source
  end
end
