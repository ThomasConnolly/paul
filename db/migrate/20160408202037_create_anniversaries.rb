class CreateAnniversaries < ActiveRecord::Migration
  def change
    create_table :anniversaries do |t|
      t.string :salutation
      t.string :last_name
      t.date :anniversary

      t.timestamps null: false
    end
  end
end
