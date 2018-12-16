class DropTableSponsorships < ActiveRecord::Migration[5.2]
  def change
    drop_table :sponsorships
  end
end
