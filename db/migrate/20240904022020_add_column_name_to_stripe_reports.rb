class AddColumnNameToStripeReports < ActiveRecord::Migration[7.2]
  def change
    add_column :stripe_reports, :payment_intent_id, :string
  end
end
