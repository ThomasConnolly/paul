require 'rails_helper'

RSpec.describe Syllabus, regressor: true do

  # === Relations ===
  
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :year }
  it { is_expected.to have_db_column :grade }
  it { is_expected.to have_db_column :title1 }
  it { is_expected.to have_db_column :title2 }
  it { is_expected.to have_db_column :title3 }
  it { is_expected.to have_db_column :title4 }
  it { is_expected.to have_db_column :title5 }
  it { is_expected.to have_db_column :title6 }
  it { is_expected.to have_db_column :title7 }
  it { is_expected.to have_db_column :title8 }
  it { is_expected.to have_db_column :title9 }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :theme }
  it { is_expected.to have_db_column :quarter }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :year }
  it { is_expected.to validate_presence_of :grade }
  it { is_expected.to validate_presence_of :quarter }
  it { is_expected.to validate_presence_of :theme }
  it { is_expected.to validate_presence_of :title9 }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  it { is_expected.to define_enum_for(:quarter).with(["I", "II", "III", "IV"]) }
  
end