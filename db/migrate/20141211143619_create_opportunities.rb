class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :ministry
      t.string :who
      t.string :what
      t.string :when
      t.string :where
      t.integer :user_id

      t.timestamps
    end
  end
end
