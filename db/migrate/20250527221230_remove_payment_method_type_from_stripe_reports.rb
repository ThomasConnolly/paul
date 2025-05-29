# frozen_string_literal: true

class RemovePaymentMethodTypeFromStripeReports < ActiveRecord::Migration[8.0]
  def change
    remove_column :stripe_reports, :payment_method_type, :string
  end
end
