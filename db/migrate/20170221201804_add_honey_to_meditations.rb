class AddHoneyToMeditations < ActiveRecord::Migration
  def change
    add_column :meditations, :honey, :string, default: nil
  end
end
