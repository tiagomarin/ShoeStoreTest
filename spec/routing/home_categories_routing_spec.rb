require "rails_helper"

RSpec.describe HomeCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/home_categories").to route_to("home_categories#index")
    end

    it "routes to #new" do
      expect(get: "/home_categories/new").to route_to("home_categories#new")
    end

    it "routes to #show" do
      expect(get: "/home_categories/1").to route_to("home_categories#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/home_categories/1/edit").to route_to("home_categories#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/home_categories").to route_to("home_categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/home_categories/1").to route_to("home_categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/home_categories/1").to route_to("home_categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/home_categories/1").to route_to("home_categories#destroy", id: "1")
    end
  end
end
