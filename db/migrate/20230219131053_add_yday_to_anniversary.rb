class AddYdayToAnniversary < ActiveRecord::Migration[7.0]
  def change
    add_column :anniversaries, :yday, :integer
  end
end
