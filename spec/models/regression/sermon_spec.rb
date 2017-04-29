require 'rails_helper'

RSpec.describe Sermon, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :homilist }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :cites }
  it { is_expected.to have_db_column :sermon_body }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :homilist_id }
  it { is_expected.to have_db_column :delivered_on }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :sermon_body }
  it { is_expected.to validate_presence_of :delivered_on }
  it { is_expected.to validate_presence_of :homilist_id }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end