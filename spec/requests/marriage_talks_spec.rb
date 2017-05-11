require 'rails_helper'

RSpec.describe "MarriageTalks", type: :request do
  describe "GET /marriage_talks" do
    it "works! (now write some real specs)" do
      get marriage_talks_path
      expect(response).to have_http_status(200)
    end
  end
end
