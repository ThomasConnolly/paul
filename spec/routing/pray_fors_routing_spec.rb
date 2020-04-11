require "rails_helper"

RSpec.describe PrayForsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pray_fors").to route_to("pray_fors#index")
    end

    it "routes to #new" do
      expect(get: "/pray_fors/new").to route_to("pray_fors#new")
    end

    it "routes to #show" do
      expect(get: "/pray_fors/1").to route_to("pray_fors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/pray_fors/1/edit").to route_to("pray_fors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/pray_fors").to route_to("pray_fors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pray_fors/1").to route_to("pray_fors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pray_fors/1").to route_to("pray_fors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pray_fors/1").to route_to("pray_fors#destroy", id: "1")
    end
  end
end
