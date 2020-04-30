class RemoveAnonymousFromDonations < ActiveRecord::Migration[6.0]
  def change
    remove_column :donations, :anonymous, :boolean
  end
end
