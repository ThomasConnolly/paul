class AddColumnProductToPledges < ActiveRecord::Migration[5.2]
  def change
    add_column :pledges, :product, :string, default: "prod_ETteQ8s9Ho9sNW"
  end
end
