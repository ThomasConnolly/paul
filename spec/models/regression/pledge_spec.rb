require 'rails_helper'

RSpec.describe Pledge, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :divisor }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :amount }
  it { is_expected.to have_db_column :pay_this }
  it { is_expected.to have_db_column :plan }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :amount }
  it { is_expected.to validate_presence_of :divisor }
  it { is_expected.to validate_presence_of :user_id }

  # === Validations (Numericality) ===
  it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
  it { is_expected.not_to validate_numericality_of(:amount).is_greater_than(-1) }
  it { is_expected.to validate_numericality_of(:divisor).is_greater_than(0) }
  it { is_expected.not_to validate_numericality_of(:divisor).is_greater_than(-1) }

  
  # === Enums ===
  
  
end