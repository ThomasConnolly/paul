class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :parish_survey_id

      t.timestamps null: false
    end
  end
end
