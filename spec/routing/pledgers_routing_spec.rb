require "rails_helper"

RSpec.describe PledgersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/pledgers").to route_to("pledgers#index")
    end

    it "routes to #new" do
      expect(:get => "/pledgers/new").to route_to("pledgers#new")
    end

    it "routes to #show" do
      expect(:get => "/pledgers/1").to route_to("pledgers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pledgers/1/edit").to route_to("pledgers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/pledgers").to route_to("pledgers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pledgers/1").to route_to("pledgers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pledgers/1").to route_to("pledgers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pledgers/1").to route_to("pledgers#destroy", :id => "1")
    end
  end
end
