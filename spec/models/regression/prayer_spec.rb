require 'rails_helper'

RSpec.describe Prayer, regressor: true do

  # === Relations ===
  
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :day_of_prayer }
  it { is_expected.to have_db_column :time_of_prayer }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :honey }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :pray_time }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :day_of_prayer }
  it { is_expected.to validate_presence_of :time_of_prayer }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end