class DropTableFranklin < ActiveRecord::Migration[5.2]
  def change
    drop_table :franklins
  end
end
