require 'rails_helper'

RSpec.describe "FakeStripes", type: :request do
  describe "GET /fake_stripes" do
    it "works! (now write some real specs)" do
      get fake_stripes_path
      expect(response).to have_http_status(200)
    end
  end
end
