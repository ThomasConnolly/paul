class AddAwayZipToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :away_zip, :string
  end
end
