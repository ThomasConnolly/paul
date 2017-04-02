class AddPrayTimeToPrayers < ActiveRecord::Migration
  def change
    add_column :prayers, :pray_time, :integer
  end
end
