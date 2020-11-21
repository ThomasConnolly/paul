class CreateThankfuls < ActiveRecord::Migration[6.0]
  def change
    create_table :thankfuls do |t|
      t.text :body

      t.timestamps
    end
  end
end
