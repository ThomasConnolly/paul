require "rails_helper"

RSpec.describe AlbergueChildrenController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/albergue_children").to route_to("albergue_children#index")
    end

    it "routes to #new" do
      expect(get: "/albergue_children/new").to route_to("albergue_children#new")
    end

    it "routes to #show" do
      expect(get: "/albergue_children/1").to route_to("albergue_children#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/albergue_children/1/edit").to route_to("albergue_children#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/albergue_children").to route_to("albergue_children#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/albergue_children/1").to route_to("albergue_children#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/albergue_children/1").to route_to("albergue_children#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/albergue_children/1").to route_to("albergue_children#destroy", id: "1")
    end
  end
end
