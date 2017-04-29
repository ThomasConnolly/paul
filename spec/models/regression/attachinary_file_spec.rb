require 'rails_helper'

RSpec.describe Attachinary::File, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :attachinariable }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :attachinariable_id }
  it { is_expected.to have_db_column :attachinariable_type }
  it { is_expected.to have_db_column :scope }
  it { is_expected.to have_db_column :public_id }
  it { is_expected.to have_db_column :version }
  it { is_expected.to have_db_column :width }
  it { is_expected.to have_db_column :height }
  it { is_expected.to have_db_column :format }
  it { is_expected.to have_db_column :resource_type }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["attachinariable_type", "attachinariable_id", "scope"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :public_id }
  it { is_expected.to validate_presence_of :version }
  it { is_expected.to validate_presence_of :resource_type }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end