require 'rails_helper'

RSpec.describe Meditation, regressor: true do

  # === Relations ===
  
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :body }
  it { is_expected.to have_db_column :scripture }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :prayer }
  it { is_expected.to have_db_column :publish_on }
  it { is_expected.to have_db_column :honey }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  



  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end