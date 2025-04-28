# frozen_string_literal: true

class CreatePageContents < ActiveRecord::Migration[8.0]
  def change
    create_table :page_contents do |t|
      t.string :section
      t.string :title
      t.text :body
      t.boolean :active

      t.timestamps
    end
  end
end
