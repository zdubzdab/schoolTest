require 'rails_helper'

describe Test do

  it "has a valid factory" do
    expect(build(:test)).to be_valid
  end

  let(:test) { FactoryGirl.create(:test) }

  describe "associations" do

    it { expect(test).to have_many(:answers) }
    it { expect(test).to have_one(:theme).through(:test_setting) }
    it { expect(test).to belong_to(:test_setting) }
    it { expect(test).to belong_to(:user) }
    it { expect(test).to accept_nested_attributes_for(:answers) }
  end

  describe "method count_test_result" do

    before do
      #creation test with result 0
      test_setting = FactoryGirl.create(:test_setting)
      @test_with_result_0 = FactoryGirl.create(:test, test_setting_id: test_setting.id)
      question1 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      question2 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      question3 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      answer_setting1 = FactoryGirl.create(:answer_setting, question_id: question1.id, rigth: true)
      answer_setting2 = FactoryGirl.create(:answer_setting, question_id: question2.id, rigth: true)
      answer_setting3 = FactoryGirl.create(:answer_setting, question_id: question3.id, rigth: true)
      answer1 = FactoryGirl.create(:answer, test_id: @test_with_result_0.id, answer_setting_id: answer_setting1.id, checked: false)
      answer2 = FactoryGirl.create(:answer, test_id: @test_with_result_0.id, answer_setting_id: answer_setting2.id, checked: false)
      answer3 = FactoryGirl.create(:answer, test_id: @test_with_result_0.id, answer_setting_id: answer_setting3.id, checked: false)
    end

    before do
      #creation test with result 33
      test_setting = FactoryGirl.create(:test_setting)
      @test_with_result_33 = FactoryGirl.create(:test, test_setting_id: test_setting.id)
      question1 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      question2 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      question3 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      answer_setting1 = FactoryGirl.create(:answer_setting, question_id: question1.id, rigth: true)
      answer_setting2 = FactoryGirl.create(:answer_setting, question_id: question2.id, rigth: true)
      answer_setting3 = FactoryGirl.create(:answer_setting, question_id: question3.id, rigth: true)
      answer1 = FactoryGirl.create(:answer, test_id: @test_with_result_33.id, answer_setting_id: answer_setting1.id, checked: true)
      answer2 = FactoryGirl.create(:answer, test_id: @test_with_result_33.id, answer_setting_id: answer_setting2.id, checked: false)
      answer3 = FactoryGirl.create(:answer, test_id: @test_with_result_33.id, answer_setting_id: answer_setting3.id, checked: false)
    end

    before do
      #creation test with result 66
      test_setting = FactoryGirl.create(:test_setting)
      @test_with_result_66 = FactoryGirl.create(:test, test_setting_id: test_setting.id)
      question1 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      question2 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      question3 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      answer_setting1 = FactoryGirl.create(:answer_setting, question_id: question1.id, rigth: true)
      answer_setting2 = FactoryGirl.create(:answer_setting, question_id: question2.id, rigth: true)
      answer_setting3 = FactoryGirl.create(:answer_setting, question_id: question3.id, rigth: true)
      answer1 = FactoryGirl.create(:answer, test_id: @test_with_result_66.id, answer_setting_id: answer_setting1.id, checked: true)
      answer2 = FactoryGirl.create(:answer, test_id: @test_with_result_66.id, answer_setting_id: answer_setting2.id, checked: true)
      answer3 = FactoryGirl.create(:answer, test_id: @test_with_result_66.id, answer_setting_id: answer_setting3.id, checked: false)
    end

    before do
      #creation test with result 100
      test_setting = FactoryGirl.create(:test_setting)
      @test_with_result_100 = FactoryGirl.create(:test, test_setting_id: test_setting.id)
      question1 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      question2 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      question3 = FactoryGirl.create(:question, test_setting_id: test_setting.id)
      answer_setting1 = FactoryGirl.create(:answer_setting, question_id: question1.id, rigth: true)
      answer_setting2 = FactoryGirl.create(:answer_setting, question_id: question2.id, rigth: true)
      answer_setting3 = FactoryGirl.create(:answer_setting, question_id: question3.id, rigth: true)
      answer1 = FactoryGirl.create(:answer, test_id: @test_with_result_100.id, answer_setting_id: answer_setting1.id, checked: true)
      answer2 = FactoryGirl.create(:answer, test_id: @test_with_result_100.id, answer_setting_id: answer_setting2.id, checked: true)
      answer3 = FactoryGirl.create(:answer, test_id: @test_with_result_100.id, answer_setting_id: answer_setting3.id, checked: true)
    end

    it "result should be 0" do
      @test_with_result_0.send(:count_test_result)
      expect(@test_with_result_0.complete_pers).to eq(0)
    end

    it "result should be 33" do
      @test_with_result_33.send(:count_test_result)
      expect(@test_with_result_33.complete_pers).to eq(33)
    end

    it "result should be 66" do
      @test_with_result_66.send(:count_test_result)
      expect(@test_with_result_66.complete_pers).to eq(66)
    end

    it "result should be 100" do
      @test_with_result_100.send(:count_test_result)
      expect(@test_with_result_100.complete_pers).to eq(100)
    end

  end

end
