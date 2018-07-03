class ChangeRatingsCharacteristicIdToCandidateId < ActiveRecord::Migration[5.2]
  def change
    rename_column :ratings, :characteristic_id, :candidate_id
    end
  end
