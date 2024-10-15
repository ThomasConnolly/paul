class AddDateToStripeReports < ActiveRecord::Migration[7.2]
  def change
    add_column :stripe_reports, :date, :datetime
  end
end
