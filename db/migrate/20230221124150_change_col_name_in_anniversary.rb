class ChangeColNameInAnniversary < ActiveRecord::Migration[7.0]
  def change
    rename_column :anniversaries, :anniversary, :marriage
  end
end
