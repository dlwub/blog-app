require "rails_helper"

RSpec.describe Api::PetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/pets").to route_to("api/pets#index")
    end

    it "routes to #new" do
      expect(get: "/api/pets/new").to route_to("api/pets#new")
    end

    it "routes to #show" do
      expect(get: "/api/pets/1").to route_to("api/pets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/api/pets/1/edit").to route_to("api/pets#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/pets").to route_to("api/pets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/pets/1").to route_to("api/pets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/pets/1").to route_to("api/pets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/pets/1").to route_to("api/pets#destroy", id: "1")
    end
  end
end
