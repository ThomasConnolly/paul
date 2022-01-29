# frozen_string_literal: true

class CreateShots < ActiveRecord::Migration[6.1]
  def change
    create_table :shots do |t|
      t.string :last_name
      t.string :first_name
      t.date :dob
      t.string :email
      t.string :phone
      t.string :shot_time
      t.string :status
      t.string :honey

      t.timestamps
    end
  end
end
