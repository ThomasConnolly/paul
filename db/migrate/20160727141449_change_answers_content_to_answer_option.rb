class ChangeAnswersContentToAnswerOption < ActiveRecord::Migration
  def change
    rename_column :answers, :content, :answer_option
  end
end
