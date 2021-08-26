class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.string :session
      t.string :first_preferred_day
      t.string :first_preferred_time
      t.string :second_preferred_day
      t.string :second_preferred_time

      t.timestamps
    end
  end
end
