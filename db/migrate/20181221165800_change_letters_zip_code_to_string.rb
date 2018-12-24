class ChangeLettersZipCodeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :letters, :zip_code, :string
    end
  end
