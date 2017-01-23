class AddDeliveredOnToFormationTalks < ActiveRecord::Migration
   def change
    add_column :formation_talks, :delivered_on, :date
  end
end
