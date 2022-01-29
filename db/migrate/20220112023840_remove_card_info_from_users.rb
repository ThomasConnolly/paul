# frozen_string_literal: true

class RemoveCardInfoFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :card_brand
    remove_column :users, :card_last4
    remove_column :users, :card_exp_month
    remove_column :users, :card_exp_year
  end
end
