require 'rails_helper'

RSpec.describe Ticket, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :event }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :price }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :event_id }
  it { is_expected.to have_db_column :quantity }
  it { is_expected.to have_db_column :amount }
  it { is_expected.to have_db_column :first_name }
  it { is_expected.to have_db_column :last_name }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :card }
  it { is_expected.to have_db_column :customer_id }
  it { is_expected.to have_db_column :honey }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["event_id"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end