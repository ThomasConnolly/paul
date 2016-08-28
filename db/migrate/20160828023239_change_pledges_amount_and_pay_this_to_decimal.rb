class ChangePledgesAmountAndPayThisToDecimal < ActiveRecord::Migration
  def change
    remove_column :pledges, :amount, :integer
    add_column :pledges, :amount, :decimal, :precision => 15, :scale => 2
    remove_column :pledges, :pay_this, :integer
    add_column :pledges, :pay_this, :decimal, :precision => 15, :scale => 2
  end
end
