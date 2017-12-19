class AddEmailToSponsorships < ActiveRecord::Migration[5.1]
  def change
  	add_column :sponsorships, :email, :string
  end
end
