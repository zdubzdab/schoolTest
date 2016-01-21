class Test < ActiveRecord::Base
  belongs_to :test_setting
  belongs_to :user
  has_one :theme, through: :test_setting
  has_many :answers

  accepts_nested_attributes_for :answers

  after_create :count_result

  resourcify#rolify

  class_attribute :current_user

  def count_result
    true_answers = Answer.current_test(Test.last.id).current_student(current_user.id).with_true.joins(:answer_setting).where( answer_settings: {rigth: 'true'} )
    # true_answers = Answer.all
    all_questions = Test.last.test_setting.questions
    result = true_answers.count / all_questions.count * 100
    Test.last.update_attributes(complete_pers: result)
  end
end
