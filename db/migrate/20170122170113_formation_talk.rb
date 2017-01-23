class FormationTalk < ActiveRecord::Migration
  def change
    create_table :formation_talks do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
