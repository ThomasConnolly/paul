# frozen_string_literal: true

class ChangePledgePlanToPrice < ActiveRecord::Migration[8.0]
  def change
    rename_column :pledges, :plan, :price
    rename_column :pledges, :plan_id, :price_id
  end
end
