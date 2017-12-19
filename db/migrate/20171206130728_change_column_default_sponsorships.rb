class ChangeColumnDefaultSponsorships < ActiveRecord::Migration[5.1]
  def change
  	change_column_default(:sponsorships, :plan, nil)
  end
end
