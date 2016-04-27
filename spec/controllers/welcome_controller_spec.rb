require 'rails_helper'

describe WelcomeController do

  describe "GET #index" do

    before do
      @tiding_list = FactoryGirl.create_list(:tiding, 3)
      @last_tiding = @tiding_list.last
      @last_tiding.update_attributes(title: "Desire new")
      get :index
    end

    it "returns desire tidings" do
      expect(assigns(:tidings)).to match_array @tiding_list
    end

    it "returns desire main tiding" do
      expect(assigns(:tiding).title).to eq ("Desire new")
    end

    it "returns empty array if main tiding blank", skip_before: true do
      expect(assigns(:images)).to eq ([])
    end

    it "returns desire images if main tiding isn't blank" do
      @last_tiding.images << FactoryGirl.create(:image)
      expect(assigns(:images)).to eq (@last_tiding.images)
    end

    it { expect respond_with(200) }
    it { expect render_template('index') }
  end

  describe "GET #search" do
    before do
      FactoryGirl.create_list(:tiding, 3)
      FactoryGirl.create(:tiding, title: "Desire new")
      xhr :get, :search, title: "Desire new"
    end

    it { expect respond_with(200) }

    it "returns tidings with the desire title" do
      expect(assigns(:tidings)[0].title).to eq ("Desire new")
    end
  end

  describe "GET #show" do

    before do
      @tiding_list = FactoryGirl.create_list(:tiding, 3)
      @tiding = @tiding_list.first
      @tiding.update_attributes(title: "Desire new")
      get :show, id: @tiding
    end

    it "returns requested tiding" do
      expect(assigns(:tiding)).to eq(@tiding)
    end

    it "returns desire tidings" do
      expect(assigns(:tidings)).to match_array @tiding_list
    end

    it "returns empty array if main tiding blank", skip_before: true do
      expect(assigns(:images)).to eq ([])
    end

    it "returns desire images if tiding isn't blank" do
      @tiding.images << FactoryGirl.create(:image)
      expect(assigns(:images)).to eq (@tiding.images)
    end

    it "renders the #show view" do
      expect(response).to render_template :show
      expect respond_with(200)
    end
  end

end
