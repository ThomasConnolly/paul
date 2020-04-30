class ChangePlanToTypeInDonations < ActiveRecord::Migration[6.0]
  def change
    rename_column :donations, :plan, :type
    
  end
end
