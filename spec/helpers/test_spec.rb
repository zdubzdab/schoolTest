require 'rails_helper'

describe TestHelper do
  include TestHelper

  describe "answers_for_question method" do

    before do
      @test = FactoryGirl.create(:test)
      @question1 = FactoryGirl.create(:question)
      @answer_setting1 = FactoryGirl.create(:answer_setting, question_id: @question1.id)
      @answer_list1 = FactoryGirl.create_list(:answer, 2, test_id: @test.id, answer_setting_id: @answer_setting1.id)
      @question2 = FactoryGirl.create(:question)
      @answer_setting2 = FactoryGirl.create(:answer_setting, question_id: @question2.id)
      @answer_list2 = FactoryGirl.create_list(:answer, 2, test_id: @test.id, answer_setting_id: @answer_setting2.id)
      @answer_list3 = FactoryGirl.create_list(:answer, 2, answer_setting_id: @answer_setting2.id)
    end

    it "should choose answers which belongs to first question" do
      expect(answers_for_question(@test, @question1.id)).to match_array (@answer_list1)
    end

    it "shouldn't choose answers which don't belongs to first question" do
      expect(answers_for_question(@test, @question2.id)).not_to match_array (@answer_list1)
    end

    it "should choose answers which belongs to second question" do
      expect(answers_for_question(@test, @question2.id)).to match_array (@answer_list2)
    end

    it "shouldn't choose answers which don't belongs to test" do
      expect(answers_for_question(@test, @question2.id)).not_to match_array (@answer_list3)
    end

  end

  describe "add_pers_to_result method" do
    it "add % to text" do
      expect(add_pers_to_result("5")).to eq ("5%")
    end
  end

  describe "count_attempts_number method" do
    it "returns desire number" do
      expect(count_attempts_number(5, 4)).to eq (1)
      expect(count_attempts_number(0, 0)).to eq (0)
      expect(count_attempts_number(5, 0)).to eq (5)
    end
  end
end
