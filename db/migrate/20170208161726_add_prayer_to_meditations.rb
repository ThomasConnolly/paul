class AddPrayerToMeditations < ActiveRecord::Migration
  def change
    add_column :meditations, :prayer, :string
  end
end
