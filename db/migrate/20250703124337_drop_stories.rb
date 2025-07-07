class DropStories < ActiveRecord::Migration[8.0]
  def 
    drop_table :stories do |t|  
      t.string :title
      t.text :content
      t.string :author_name
      t.string :author_email
      t.references :albergue, foreign_key: true

      t.timestamps
    end 
  end
end
