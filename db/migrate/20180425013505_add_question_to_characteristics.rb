class AddQuestionToCharacteristics < ActiveRecord::Migration[5.1]
  def change
    add_column :characteristics, :question, :text
  end
end
