require 'rails_helper'

RSpec.describe Post, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user }
  
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :post_picture_files }
  it { is_expected.to have_many :photo_files }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :content }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :user_id }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_presence_of :user_id }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end