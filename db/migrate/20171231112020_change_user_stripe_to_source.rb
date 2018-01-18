class ChangeUserStripeToSource < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :stripe_id, :source
  end
end
