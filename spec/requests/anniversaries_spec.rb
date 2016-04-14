require 'rails_helper'

RSpec.describe "Anniversaries", type: :request do
  describe "GET /anniversaries" do
    it "works! (now write some real specs)" do
      get anniversaries_path
      expect(response).to have_http_status(200)
    end
  end
end
