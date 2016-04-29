class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|
      t.string :year
      t.string :grade
      t.string :quarter
      t.string :title1
      t.string :title2
      t.string :title3
      t.string :title4
      t.string :title5
      t.string :title6
      t.string :title7
      t.string :title8
      t.string :title9

      t.timestamps null: false
    end
  end
end
