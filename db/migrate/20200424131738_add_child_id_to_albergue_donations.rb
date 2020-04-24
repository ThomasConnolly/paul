class AddChildIdToAlbergueDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :albergue_donations, :child_id, :integer
  end
end
