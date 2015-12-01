class AnswerSetting < ActiveRecord::Base
  has_one :answer
  belongs_to :question

  resourcify#rolify
end
