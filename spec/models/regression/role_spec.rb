require 'rails_helper'

RSpec.describe Role, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :resource }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :resource_id }
  it { is_expected.to have_db_column :resource_type }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["name"] }
  it { is_expected.to have_db_index ["name", "resource_type", "resource_id"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end