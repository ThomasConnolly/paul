class DropSyllabuses < ActiveRecord::Migration[8.0]
  def change
    drop_table :syllabuses do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
