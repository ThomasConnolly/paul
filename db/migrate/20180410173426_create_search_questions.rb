class CreateSearchQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :search_questions do |t|
      t.text :question
      t.references :characteristic, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
