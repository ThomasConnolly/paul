class RemoveLast4AndExpFromSponsorships < ActiveRecord::Migration[5.1]
  def change
    remove_column :sponsorships, :last_4, :integer
    remove_column :sponsorships, :expiraton_date, :date
  end
end
