class DropLettersTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :letters
  end
end
