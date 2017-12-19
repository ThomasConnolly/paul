class RemoveDivisorFromSponsorships < ActiveRecord::Migration[5.1]
  def change
  	remove_column :sponsorships, :divisor, :integer
  end
end
