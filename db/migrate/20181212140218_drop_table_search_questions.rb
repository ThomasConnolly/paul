class DropTableSearchQuestions < ActiveRecord::Migration[5.2]
  def change
    drop_table :search_questions
  end
end
