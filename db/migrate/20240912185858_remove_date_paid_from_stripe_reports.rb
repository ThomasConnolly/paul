# frozen_string_literal: true

class RemoveDatePaidFromStripeReports < ActiveRecord::Migration[7.2]
  def change
    remove_column :stripe_reports, :date_paid, :date
  end
end
