require 'rails_helper'

RSpec.describe "PreschoolAs", type: :request do
  describe "GET /preschool_as" do
    it "works! (now write some real specs)" do
      get preschool_as_path
      expect(response).to have_http_status(200)
    end
  end
end
