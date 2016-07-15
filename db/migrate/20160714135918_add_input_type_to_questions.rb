class AddInputTypeToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :input_type, :string
  end
end
