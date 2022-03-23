require "rails_helper"

RSpec.describe SubmitStoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/submit_stories").to route_to("submit_stories#index")
    end

    it "routes to #new" do
      expect(get: "/submit_stories/new").to route_to("submit_stories#new")
    end

    it "routes to #show" do
      expect(get: "/submit_stories/1").to route_to("submit_stories#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/submit_stories/1/edit").to route_to("submit_stories#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/submit_stories").to route_to("submit_stories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/submit_stories/1").to route_to("submit_stories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/submit_stories/1").to route_to("submit_stories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/submit_stories/1").to route_to("submit_stories#destroy", id: "1")
    end
  end
end
