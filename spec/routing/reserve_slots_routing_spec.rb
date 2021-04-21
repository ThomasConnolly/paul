require "rails_helper"

RSpec.describe ReserveSlotsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/reserve_slots").to route_to("reserve_slots#index")
    end

    it "routes to #new" do
      expect(get: "/reserve_slots/new").to route_to("reserve_slots#new")
    end

    it "routes to #show" do
      expect(get: "/reserve_slots/1").to route_to("reserve_slots#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/reserve_slots/1/edit").to route_to("reserve_slots#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/reserve_slots").to route_to("reserve_slots#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/reserve_slots/1").to route_to("reserve_slots#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/reserve_slots/1").to route_to("reserve_slots#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/reserve_slots/1").to route_to("reserve_slots#destroy", id: "1")
    end
  end
end
