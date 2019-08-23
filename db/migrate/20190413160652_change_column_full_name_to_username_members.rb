# frozen_string_literal: true

class ChangeColumnFullNameToUsernameMembers < ActiveRecord::Migration[5.2]
  def change
    rename_column :members, :full_name, :username
  end
end
