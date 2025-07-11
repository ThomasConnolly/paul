class DropAlbergueChildren < ActiveRecord::Migration[8.0]
  def change
    drop_table :albergue_children do |t|
      t.string :name
      t.string :description
      t.string :image
      t.references :albergue, foreign_key: true

      t.timestamps
    end
  end
end
