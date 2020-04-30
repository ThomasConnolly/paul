class AddDollarsToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :dollars, :integer
  end
end
