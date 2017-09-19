class AddEmailToPledges < ActiveRecord::Migration[5.1]
  def change
    add_column :pledges, :email, :string
  end
end
