require 'rails_helper'

describe Tiding do

  it "has a valid factory" do
    expect(build(:tiding)).to be_valid
  end

  let(:tiding) { FactoryGirl.create(:tiding) }

  describe 'validations' do
    it { expect validate_presence_of :title }
    it { expect validate_uniqueness_of(:title) }
    it { expect(tiding).to allow_value("Nik").for(:title) }
    it { expect(tiding).to_not allow_value("N").for(:title) }
    it { expect validate_presence_of :text }
  end

  describe "associations" do
    it { expect(tiding).to have_many(:images).dependent(:destroy) }
    it { expect(tiding).to accept_nested_attributes_for(:images) }
  end

  describe "scope tiding main" do
    it "includes main tiding" do
      expect(Tiding.main).to include(tiding)
    end
    it "excludes main tiding" do
      tiding.update_attributes(main: false)
      expect(Tiding.main).not_to include(tiding)
    end
  end

  describe "search method" do
    before do
      @tiding1 = FactoryGirl.create(:tiding, title: "Tiding")
      @tiding2 = FactoryGirl.create(:tiding, title: "Tiding2")
      @tiding3 = FactoryGirl.create(:tiding, title: "New")
    end

    it "returns desire title" do
      expect(Tiding.search("Ne")).to match_array(@tiding3)
      expect(Tiding.search("nE")).to match_array(@tiding3)
    end

    it "returns two desire title" do
      expect(Tiding.search("tid")).to include(@tiding1)
      expect(Tiding.search("tid")).to include(@tiding2)
      expect(Tiding.search("TID")).to include(@tiding1)
      expect(Tiding.search("tId")).to include(@tiding2)
    end

    it "returns nothing" do
      expect(Tiding.search("ttt")).to eq([])
    end
  end

end
