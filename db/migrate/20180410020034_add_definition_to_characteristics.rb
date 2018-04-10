class AddDefinitionToCharacteristics < ActiveRecord::Migration[5.1]
  def change
    add_column :characteristics, :definition, :text
  end
end
