require 'rails_helper'

describe TestSetting do

  it "has a valid factory" do
    expect(build(:test_setting)).to be_valid
  end

  let(:test_setting) { FactoryGirl.create(:test_setting) }

  describe 'validations' do

    it { expect validate_presence_of :name }
    it { expect validate_presence_of :time_to_pass }
  end

  describe "associations" do

    it { expect(test_setting).to have_many(:tests) }
    it { expect(test_setting).to have_many(:questions) }
    it { expect(test_setting).to have_many(:users).through(:tests) }
    it { expect(test_setting).to belong_to(:categgory) }
    it { expect(test_setting).to belong_to(:subject) }
    it { expect(test_setting).to belong_to(:theme) }
    it { expect(test_setting).to belong_to(:user) }
    it { expect(test_setting).to accept_nested_attributes_for(:questions) }
  end

  describe "scope test_setting with_theme" do

    let(:theme) { FactoryGirl.create(:theme) }

    it "includes test_setting with_theme" do
      test_setting.update_attributes(theme_id: theme.id)
      expect(TestSetting.with_theme(theme.id)).to include(test_setting)
    end

    it "excludes test_setting with_theme" do
      expect(TestSetting.with_theme(theme.id)).not_to include(test_setting)
    end
  end

end
