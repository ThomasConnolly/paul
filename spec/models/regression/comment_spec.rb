require 'rails_helper'

RSpec.describe Comment, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :commentable }
  it { is_expected.to belong_to :user }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :body }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :commentable_id }
  it { is_expected.to have_db_column :commentable_type }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :body }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end