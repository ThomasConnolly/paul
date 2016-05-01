class AddColumnToSyllabuses < ActiveRecord::Migration
  def change
    add_column :syllabuses, :theme, :string
  end
end
