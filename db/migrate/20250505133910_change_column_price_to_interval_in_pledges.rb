# frozen_string_literal: true

class ChangeColumnPriceToIntervalInPledges < ActiveRecord::Migration[8.0]
  def change
    rename_column :pledges, :price, :interval
  end
end
