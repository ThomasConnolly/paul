class ChangeSyllabusesGradeToInteger < ActiveRecord::Migration
  def change
    remove_column :syllabuses, :quarter, :string
    add_column :syllabuses, :quarter, :integer
  end
end