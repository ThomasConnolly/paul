require 'rails_helper'

RSpec.describe Event, regressor: true do

  # === Relations ===
  
  
  it { is_expected.to have_many :tickets }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :price }
  it { is_expected.to have_db_column :date }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :quantity }
  it { is_expected.to have_db_column :amount }
  it { is_expected.to have_db_column :url }
  it { is_expected.to have_db_column :time }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :title }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end