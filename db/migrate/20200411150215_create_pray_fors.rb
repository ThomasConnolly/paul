class CreatePrayFors < ActiveRecord::Migration[6.0]
  def change
    create_table :pray_fors do |t|
      t.string :first_name
      t.string :reason
      t.string :honey

      t.timestamps
    end
  end
end
