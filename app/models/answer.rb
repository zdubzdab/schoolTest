class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer_setting
  belongs_to :test
  delegate :question_id, to: :answer_setting
  resourcify#rolify

  scope :with_true, -> { where(checked: 'true' ) }
  scope :belongs_to_current_test, ->(test_id){ where(answers: {test_id: test_id} ) }
end
