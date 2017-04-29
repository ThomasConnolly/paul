require 'rails_helper'

RSpec.describe User, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :invited_by }
  it { is_expected.to have_one :profile }
  it { is_expected.to have_one :pledge }
  it { is_expected.to have_many :avatar_files }
  it { is_expected.to have_many :posts }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :opportunities }
  it { is_expected.to have_many :story_ideas }
  it { is_expected.to have_many :vreports }
  it { is_expected.to have_many :jubilee_plans }

  # === Nested Attributes ===
  it { is_expected.to accept_nested_attributes_for :profile }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :encrypted_password }
  it { is_expected.to have_db_column :reset_password_token }
  it { is_expected.to have_db_column :reset_password_sent_at }
  it { is_expected.to have_db_column :remember_created_at }
  it { is_expected.to have_db_column :sign_in_count }
  it { is_expected.to have_db_column :current_sign_in_at }
  it { is_expected.to have_db_column :last_sign_in_at }
  it { is_expected.to have_db_column :current_sign_in_ip }
  it { is_expected.to have_db_column :last_sign_in_ip }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :first_name }
  it { is_expected.to have_db_column :last_name }
  it { is_expected.to have_db_column :full_name }
  it { is_expected.to have_db_column :member_id }
  it { is_expected.to have_db_column :invitation_token }
  it { is_expected.to have_db_column :invitation_created_at }
  it { is_expected.to have_db_column :invitation_sent_at }
  it { is_expected.to have_db_column :invitation_accepted_at }
  it { is_expected.to have_db_column :invitation_limit }
  it { is_expected.to have_db_column :invited_by_id }
  it { is_expected.to have_db_column :invited_by_type }
  it { is_expected.to have_db_column :invitations_count }
  it { is_expected.to have_db_column :customer_id }
  it { is_expected.to have_db_column :card }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["full_name"] }
  it { is_expected.to have_db_index ["invitation_token"] }
  it { is_expected.to have_db_index ["invitations_count"] }
  it { is_expected.to have_db_index ["invited_by_id"] }
  it { is_expected.to have_db_index ["reset_password_token"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end