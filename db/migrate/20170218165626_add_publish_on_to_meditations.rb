class AddPublishOnToMeditations < ActiveRecord::Migration
  def change
  add_column :meditations, :publish_on, :date
  end
end
