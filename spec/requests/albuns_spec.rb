require 'rails_helper'

RSpec.describe "Albuns", type: :request do
  describe "GET /albuns" do
    it "works! (now write some real specs)" do
      get albuns_path
      expect(response).to have_http_status(200)
    end
  end
end
