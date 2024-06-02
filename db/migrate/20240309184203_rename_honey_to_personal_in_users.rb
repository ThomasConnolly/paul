# typed: false
# frozen_string_literal: true

class RenameHoneyToPersonalInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :honey, :personal
  end
end
