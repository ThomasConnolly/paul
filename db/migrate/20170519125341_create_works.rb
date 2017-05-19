class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :my_act
      t.string :honey

      t.timestamps
    end
  end
end
