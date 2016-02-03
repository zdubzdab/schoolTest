class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer_setting
  belongs_to :test

  resourcify#rolify

  scope :with_true, -> { where(rigth: 'true' ) }
  scope :belongs_to_current_test, ->(test_id){ where(answers: {test_id: test_id} ) }
end
