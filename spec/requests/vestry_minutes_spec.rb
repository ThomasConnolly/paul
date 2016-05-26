require 'rails_helper'

RSpec.describe "VestryMinutes", type: :request do
  describe "GET /vestry_minutes" do
    it "works! (now write some real specs)" do
      get vestry_minutes_path
      expect(response).to have_http_status(200)
    end
  end
end
