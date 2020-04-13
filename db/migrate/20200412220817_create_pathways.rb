class CreatePathways < ActiveRecord::Migration[6.0]
  def change
    create_table :pathways do |t|
      t.string :image
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
