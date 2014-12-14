class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :cities
      t.text :background
      t.text :career
      t.text :family
      t.text :lifestyle
      t.text :civic
      t.text :church

      t.timestamps
    end
  end
end
