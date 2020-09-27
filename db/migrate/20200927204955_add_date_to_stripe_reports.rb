class AddDateToStripeReports < ActiveRecord::Migration[6.0]
  def change
    add_column :stripe_reports, :date_paid, :date
  end
end
