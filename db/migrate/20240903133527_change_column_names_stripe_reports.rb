class ChangeColumnNamesStripeReports < ActiveRecord::Migration[7.2]
  def change
    remove_column :stripe_reports, :user_id
    remove_column :stripe_reports, :pledge_id
    remove_column :stripe_reports, :donation_id
    add_column :stripe_reports, :donor_name, :string
  end
end
