class DropTableCharacteristics < ActiveRecord::Migration[5.2]
  def change
    drop_table :characteristics
  end
end
