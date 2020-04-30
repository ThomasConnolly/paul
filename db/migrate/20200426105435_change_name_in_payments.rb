class ChangeNameInPayments < ActiveRecord::Migration[6.0]
  def change
    rename_column :payments, :donations_id, :donation_id
  end
end
