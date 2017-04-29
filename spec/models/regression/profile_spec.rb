require 'rails_helper'

RSpec.describe Profile, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :cities }
  it { is_expected.to have_db_column :background }
  it { is_expected.to have_db_column :career }
  it { is_expected.to have_db_column :family }
  it { is_expected.to have_db_column :lifestyle }
  it { is_expected.to have_db_column :civic }
  it { is_expected.to have_db_column :church }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end