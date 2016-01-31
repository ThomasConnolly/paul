# == Schema Information
#
# Table name: members
#
#  id          :integer          not null, primary key
#  last_name   :string
#  first_name  :string
#  email       :string
#  anniversary :date
#  birthday    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  member_id   :integer
#

require 'rails_helper'

RSpec.describe MembersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #import" do
    it "returns http success" do
      get :import
      expect(response).to have_http_status(:success)
    end
  end

end
