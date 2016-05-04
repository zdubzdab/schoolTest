require 'rails_helper'

describe TestSettingsHelper do
  include TestSettingsHelper

  describe "all_subject_options method" do
    before { @subject_list = FactoryGirl.create_list(:subject, 2) }
    it "array should include name" do
      expect(all_subject_options[0]).to include("Name№1")
      expect(all_subject_options[1]).to include("Name№2")
    end
  end

  describe "chop method" do
    it "should keep name" do
      expect(chop("a/b/c/d/e.doc")).to eq (" e.doc")
      expect(chop("affffff/bfffff/cfff/dfff/document.doc")).to eq (" document.doc")
    end
  end

  describe "result method" do
    before do
      @test_setting = FactoryGirl.create(:test_setting)
      @test_with_result_0 = FactoryGirl.create(:test, test_setting_id: @test_setting.id, complete_pers: 0)
      @test_with_result_11 = FactoryGirl.create(:test, test_setting_id: @test_setting.id, complete_pers: 11)
      @test_with_result_100 = FactoryGirl.create(:test, complete_pers: 100)
    end

    describe "result should be 11" do
      it "should eq" do
        expect(result(Test.all)).to eq (11)
      end
    end

    describe "result should be 33" do
      before do
        @test_with_result_33 = FactoryGirl.create(:test, test_setting_id: @test_setting.id, complete_pers: 33)
      end
      it "should eq" do
        expect(result(Test.all)).to eq (33)
      end
    end

    describe "result should be 99" do
      before do
        @test_with_result_99 = FactoryGirl.create(:test, test_setting_id: @test_setting.id, complete_pers: 99)
      end
      it "should eq" do
        expect(result(Test.all)).to eq (99)
      end
    end
  end

  describe "test_created method" do
    before do
      @test = FactoryGirl.create(:test)
      @test.created_at = "2016-04-12 14:02:52.00000"
    end
    it "should show time in desired format" do
      expect(test_created(@test)).to eq ("14:02:52  12/04/16")
    end
  end
end
