class AddPaymentTypeToStripeReports < ActiveRecord::Migration[7.2]
  def change
    add_column :stripe_reports, :payment_method_type, :string
  end
end
