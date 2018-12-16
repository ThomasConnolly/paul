require 'rails_helper'

RSpec.describe "Pledgers", type: :request do
  describe "GET /pledgers" do
    it "works! (now write some real specs)" do
      get pledgers_path
      expect(response).to have_http_status(200)
    end
  end
end
