class AddCutterToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :cutter, :string
  end
end
