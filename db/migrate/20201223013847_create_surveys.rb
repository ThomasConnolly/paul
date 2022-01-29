# frozen_string_literal: true

class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.string :q1
      t.string :q2
      t.string :q3
      t.text :a1
      t.text :a2
      t.text :a3
      t.text :added_comments

      t.timestamps
    end
  end
end
