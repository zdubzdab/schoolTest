class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer_setting
  belongs_to :test

  resourcify#rolify

  scope :with_true, -> { where(rigth: 'true' ) }
  scope :current_student, ->(user_id){ where(answers: {user_id: user_id} ) }
  scope :current_test, ->(test_id){ where(answers: {test_id: test_id} ) }
end
