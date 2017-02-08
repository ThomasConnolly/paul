class AddNameToMeditations < ActiveRecord::Migration
  def change
    add_column :meditations, :name, :string
  end
end
