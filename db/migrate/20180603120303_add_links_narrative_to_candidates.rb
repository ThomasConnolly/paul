class AddLinksNarrativeToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :links_narrative, :text
  end
end
