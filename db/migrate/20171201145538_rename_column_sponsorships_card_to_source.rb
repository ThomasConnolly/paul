class RenameColumnSponsorshipsCardToSource < ActiveRecord::Migration[5.1]
  def change
  	rename_column :sponsorships, :card, :source
  end
end
