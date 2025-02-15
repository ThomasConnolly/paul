# frozen_string_literal: true

class RemoveDateFromStripeReport < ActiveRecord::Migration[7.2]
  def change
    remove_column :stripe_reports, :date, :datetime
  end
end
