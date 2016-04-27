require 'rails_helper'

describe Students::TestSettingsController do

  describe "GET #index" do

    let(:student1) { FactoryGirl.create(:student_with_subjects) }
    let(:student2) { FactoryGirl.create(:student_with_subjects) }
    before do
      sign_in :user, student1
      get :index, user_id: student1.id
    end

    it { expect respond_with(200) }
    it { expect render_template('index') }

    it "returns current_user subjects" do
      expect(assigns(:subjects)).to match_array student1.subjects
    end
  end

  describe "GET #search_test_settings" do

    # let(:theme) { FactoryGirl.create(:theme) }
    # let(:test_setting_list) { FactoryGirl.create_list(:test_setting, 3, theme_id: theme.id ) }
    before do
      student = FactoryGirl.create(:student)
      sign_in :user, student
      theme = FactoryGirl.create(:theme)
      @test_setting_list = FactoryGirl.create_list(:test_setting, 3, theme_id: theme.id)
      params = { key: theme.name }
      xhr :get, :search_test_settings, params
    end

    it { expect respond_with(200) }

    it "returns desire test settings" do
      expect(assigns(:test_setting)).to match_array @test_setting_list
    end
  end

  describe "GET #show" do

    let(:student) { FactoryGirl.create(:student) }
    let(:student1) { FactoryGirl.create(:student) }
    let(:test_setting) { FactoryGirl.create(:test_setting) }
    let(:test_setting1) { FactoryGirl.create(:test_setting) }
    before do
      @test = FactoryGirl.create_list(:test, 2, user_id: student.id, test_setting_id: test_setting.id)
      @test1 = FactoryGirl.create_list(:test, 2, user_id: student1.id, test_setting_id: test_setting1.id)
      allow(controller).to receive(:current_user).and_return student
      get :show, id: test_setting.id
    end

    it "assigns the requested test_setting to test_setting" do
      expect(assigns(:test_setting)).to eq(test_setting)
    end

    it "returns desire @attempts_number" do
      expect(assigns(:attempts_number)).to eq(@test.count)
    end

    it "renders the #show view" do
      expect(response).to render_template :show
      expect respond_with(200)
    end
  end
end
