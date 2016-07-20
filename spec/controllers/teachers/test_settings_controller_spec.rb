require 'rails_helper'

describe Teachers::TestSettingsController do

  describe "GET #index" do

    let(:teacher1) { FactoryGirl.create(:teacher) }
    let(:teacher2) { FactoryGirl.create(:teacher) }
    let(:test_setting_list1) { FactoryGirl.create_list(:test_setting, 3, user_id: teacher1.id ) }
    let(:test_setting_list2) { FactoryGirl.create_list(:test_setting, 3, user_id: teacher2.id ) }

    before do
      allow(controller).to receive(:current_user).and_return teacher1
      sign_in :user, teacher1
      get :index, user_id: teacher1.id
    end

    it "returns desire test_settings" do
      expect(assigns(:test_settings)).to match_array test_setting_list1
    end

    it { expect respond_with(200) }
    it { expect render_template('index') }
  end

  describe "GET #new" do

    let(:teacher) { FactoryGirl.create(:teacher) }
    before do
      sign_in :user, teacher
      get :new, user_id: teacher.id
    end

    it "create a new tiding" do
      expect(assigns(:test_setting)).to be_a_new(TestSetting)
      expect(assigns(:test_setting).questions.first).to be_a_new(Question)
    end

    it { expect render_template('new') }
  end

  describe "POST create" do
    context "with valid attributes" do

      before { post :create, test_setting: FactoryGirl.attributes_for(:test_setting) }

      it "creates a new test_setting" do
        expect { change(TestSetting).by(1) }
      end

      it "redirects to the page with list of current teacher tests" do
        expect(response).to redirect_to teachers_test_settings_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new test_setting" do
        params = { test_setting: { name: "" } }
        expect{
          post :create, params
        }.to_not change(TestSetting,:count)
      end

      it "re-renders the new method" do
        params = { test_setting: { name: "" } }
        post :create, params
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #show" do
    let(:test_setting1) { FactoryGirl.create(:test_setting_with_teachers) }
    let(:test_setting2) { FactoryGirl.create(:test_setting_with_teachers) }

    before do
      teacher = FactoryGirl.create(:teacher)
      sign_in :user, teacher
      get :show, id: test_setting1
    end

    it "assigns the requested test_setting to @test_setting" do
      expect(assigns(:test_setting)).to eq(test_setting1)
    end

    it "assigns the requested test_setting users to @users" do
      expect(assigns(:users).to_a.last.last).to eq(test_setting1.users)
    end

    it "renders the #show view" do
      expect(response).to render_template :show
      expect respond_with(200)
    end
  end

  describe "GET #edit" do

    let(:test_setting) { FactoryGirl.create(:test_setting) }
    before do
      teacher = FactoryGirl.create(:teacher)
      sign_in :user, teacher
      get :edit, id: test_setting
    end

    it "finds a specific test_setting" do
      expect(assigns(:test_setting)).to eq(test_setting)
    end
  end

  describe 'post #update' do

    before do
      @teacher = FactoryGirl.create(:teacher)
      sign_in :user, @teacher
    end
    let(:test_setting) { FactoryGirl.create(:test_setting, name: "Biology introduction", time_to_pass: 100, user_id: @teacher.id) }

    context "valid attributes" do
      it "changes @test_setting's attributes" do
        post :update, id: test_setting, test_setting: { name: "Chemistry" }
        test_setting.reload
        expect(test_setting.name).to eq("Chemistry")
      end

      it "redirects to the updated test_setting" do
        post :update, id: test_setting, test_setting: FactoryGirl.attributes_for(:test_setting)
        expect(response).to redirect_to teachers_test_settings_path
      end
    end

    context "invalid attributes" do
      it "does not change test_setting's attributes" do
        put :update, id: test_setting, test_setting: { name: "", time_to_pass: 200 }
        test_setting.reload
        expect(test_setting.time_to_pass).not_to eq(200)
        expect(test_setting.name).to eq("Biology introduction")
      end

      it "re-renders the edit method" do
        put :update, id: test_setting, test_setting: { name: "", time_to_pass: 200 }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'delete #destroy' do
    before do
      teacher = FactoryGirl.create(:teacher)
      sign_in :user, teacher
      @test_setting = FactoryGirl.create(:test_setting, user_id: teacher.id)
    end

    it "deletes the test_setting" do
      expect{
        xhr :delete, :destroy, id: @test_setting
      }.to change(TestSetting, :count).by(-1)
    end
  end
end
