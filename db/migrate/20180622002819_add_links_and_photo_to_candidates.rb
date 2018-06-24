class AddLinksAndPhotoToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :link4, :string
    add_column :candidates, :photo_link, :string

  end
end
