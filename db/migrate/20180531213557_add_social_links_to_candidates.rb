class AddSocialLinksToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :link1, :string
    add_column :candidates, :link2, :string
    add_column :candidates, :link3, :string
  end
end
