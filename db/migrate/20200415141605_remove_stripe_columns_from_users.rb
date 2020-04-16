class RemoveStripeColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    change_table(:users) do |t|
      t.remove :stripe_id, :card_last4, :card_type,
      :card_exp_year, :card_exp_month, :albergue_sponsor,
      :source, :stripe_pledge, :donation_id, :card  
    end
  end
end