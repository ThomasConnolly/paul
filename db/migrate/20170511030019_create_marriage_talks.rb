class CreateMarriageTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :marriage_talks do |t|
      t.string :title
      t.text :body
      t.date :delivered_on

      t.timestamps
    end
  end
end
