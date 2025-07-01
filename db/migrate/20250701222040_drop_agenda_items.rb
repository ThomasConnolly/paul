class DropAgendaItems < ActiveRecord::Migration[8.0]
  def change
    drop_table :agenda_items do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
