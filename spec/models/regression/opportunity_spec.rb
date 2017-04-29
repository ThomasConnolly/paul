require 'rails_helper'

RSpec.describe Opportunity, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :ministry }
  it { is_expected.to have_db_column :who }
  it { is_expected.to have_db_column :what }
  it { is_expected.to have_db_column :when }
  it { is_expected.to have_db_column :where }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :ministry }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end