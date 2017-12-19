class AddDefaultAmountToSponsorships < ActiveRecord::Migration[5.1]
  def change
  	change_column :sponsorships, :amount, :integer, default: 275
  end
end
