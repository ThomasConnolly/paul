require 'rails_helper'

RSpec.describe Book, regressor: true do

  # === Relations ===
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :author }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :subject }
  it { is_expected.to have_db_column :isbn }
  it { is_expected.to have_db_column :dewey }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :title }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end