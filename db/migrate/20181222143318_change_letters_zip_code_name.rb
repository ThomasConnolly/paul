class ChangeLettersZipCodeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :letters, :zip_code, :zipcode
  end
end
