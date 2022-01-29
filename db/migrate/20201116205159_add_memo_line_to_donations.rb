# frozen_string_literal: true

class AddMemoLineToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :memo, :string
  end
end
