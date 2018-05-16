class Candidates < ActiveRecord::Migration[5.1]
  def change
      create_table :candidates do |t|
      t.string :last_name
      t.string :full_name
      t.string :url

      t.timestamps
  end
end
end
