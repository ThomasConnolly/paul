require 'rails_helper'

RSpec.describe VestryMinute, regressor: true do

  # === Relations ===
  
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :date }
  it { is_expected.to have_db_column :minutes }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :date }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end