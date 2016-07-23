class CreateVoteOptions < ActiveRecord::Migration
  def change
    create_table :vote_options do |t|
      t.string :question
      t.references :survey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
