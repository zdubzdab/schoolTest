require 'rails_helper'

describe Answer do

  it "has a valid factory" do
    expect(build(:answer)).to be_valid
  end

  let(:answer) { FactoryGirl.create(:answer) }

  describe "associations" do

    it { expect(answer).to belong_to(:user) }
    it { expect(answer).to belong_to(:answer_setting) }
    it { expect(answer).to belong_to(:test) }
  end

  describe "delegate question_id from answer_setting" do

    let(:answer_setting) { FactoryGirl.create(:answer_setting, question_id: 5) }
    before do
      answer.update_attributes(answer_setting_id: answer_setting.id)
    end

    it "return desire question_id" do
      expect(answer.question_id).to eq 5
    end
  end

  describe "scope answer with true" do

    it "includes answer with checked true" do
      answer.update_attributes(checked: true)
      expect(Answer.with_true).to include(answer)
    end

    it "excludes answer with checked true" do
      answer.update_attributes(checked: false)
      expect(Answer.with_true).not_to include(answer)
    end
  end

  describe "scope answer belongs_to_current_test" do

    let(:test) { FactoryGirl.create(:test) }

    it "includes answer that belongs_to_current_test" do
      answer.update_attributes(test_id: test.id)
      expect(Answer.belongs_to_current_test(test.id)).to include(answer)
    end

    it "excludes answer that belongs_to_current_test" do
      expect(Answer.belongs_to_current_test(test.id)).not_to include(answer)
    end
  end

end
