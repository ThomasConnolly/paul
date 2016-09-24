class CreateFakeStripes < ActiveRecord::Migration
  def change
    create_table :fake_stripes do |t|
      t.string :tickets

      t.timestamps null: false
    end
  end
end
