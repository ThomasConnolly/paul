class ChangeDonationsStripePlan < ActiveRecord::Migration[6.0]
  def change
    remove_column :donations, :stripe_email, :string
    rename_column :donations, :stripe_plan, :stripe_intent
  end
end
