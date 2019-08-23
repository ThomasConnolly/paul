# frozen_string_literal: true

class AddChildToAlbergueDonation < ActiveRecord::Migration[5.2]
  def change
    add_column :albergue_donations, :child_name, :string
  end
end
