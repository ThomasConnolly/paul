class AddNameToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :name, :string
    add_column :donations, :address, :string
    add_column :donations, :city, :string
    add_column :donations, :zip, :string
  end
end
