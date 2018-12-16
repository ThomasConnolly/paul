class AddSourceToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :source, :string
  end
end
