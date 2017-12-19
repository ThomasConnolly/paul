class AddDivisorToSponsorships < ActiveRecord::Migration[5.1]
  def change
  	add_column :sponsorships, :divisor, :integer
  end
end
