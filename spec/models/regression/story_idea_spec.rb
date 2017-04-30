require 'rails_helper'

RSpec.describe StoryIdea, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user }
  
  it { is_expected.to have_many :roles }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :story_idea_picture_files }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :body }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :url }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :body }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end