class AddTypeToCharacteristics < ActiveRecord::Migration[5.1]
  def change
    add_column :characteristics, :kind, :string
  end
end
