require 'rails_helper'

RSpec.describe Member, regressor: true do

  # === Relations ===

  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :last_name }
  it { is_expected.to have_db_column :first_name }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :birthday }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :membership_id }
  it { is_expected.to have_db_column :full_name }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end