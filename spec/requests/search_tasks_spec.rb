require 'rails_helper'

RSpec.describe "SearchTasks", type: :request do
  describe "GET /search_tasks" do
    it "works! (now write some real specs)" do
      get search_tasks_path
      expect(response).to have_http_status(200)
    end
  end
end
