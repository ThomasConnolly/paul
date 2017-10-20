class ChangePledgeAmountToInteger < ActiveRecord::Migration[5.1]
  def change
  	change_column :pledges, :amount, :integer
    change_column :pledges, :pay_this, :integer  
  end
end
