# frozen_string_literal: true

class RenameFeeToStripeFeeInStripeReports < ActiveRecord::Migration[7.2]
  def change
    rename_column :stripe_reports, :fee, :stripe_fee
  end
end
