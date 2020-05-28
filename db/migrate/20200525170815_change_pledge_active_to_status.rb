class ChangePledgeActiveToStatus < ActiveRecord::Migration[6.0]
  def change
    remove_column :pledges, :active, :boolean
     add_column :pledges, :status, :string
  end
end
