require 'spec_helper'

describe RestaurantsController do
  context "GET /restaurants/:id" do
    before do
      @restaurant = FactoryGirl.create :restaurant
    end

    context "resource exists" do
      subject {get "restaurants/#{@restaurant.id}"}
      it { expect(subject).to render_template(:show)}
    end

      context "resource doesn't exist" do
      subject {get "restaurants/#{@restaurant.id + 1}"}
      it { expect(subject).to redirect_to(:root) }
    end
  end

  context "GET /restaurants/new" do
    subject {get "/restaurants/new" }

    it "renders new" do
      expect(subject).to render_template(:new)
    end
  end

  context "POST /restaurants" do
    context "complete params" do
      restaurant = {restaurant: {name: "mcrails"}}
      subject{ post "/restaurants", restaurant }
      it "redirects to show" do
        expect(subject).to redirect_to restaurant_path(id:1)
      end
    end

    context "incomplete params" do
      subject{ post "/restaurants", {}}
      it "redirects to new" do
        expect(subject).to redirect_to(new_restaurant_path)
      end
    end
  end

  context "GET /" do
    subject { get "/" }
    it "renders index" do
      expect(subject).to render_template(:index)
    end
  end
end