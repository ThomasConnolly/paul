class AddPayThisToSponsorships < ActiveRecord::Migration[5.1]
  def change
    add_column :sponsorships, :pay_this, :integer
  end
end
