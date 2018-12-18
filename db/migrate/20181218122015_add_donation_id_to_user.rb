class AddDonationIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :donation_id, :integer
  end
end
