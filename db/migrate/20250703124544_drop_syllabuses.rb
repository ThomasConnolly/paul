class DropSyllabuses < ActiveRecord::Migration[8.0]
  def change
    drop_table :syllabuses
  end
end
