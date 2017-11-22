class AddHoneyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :honey, :string
  end
end
