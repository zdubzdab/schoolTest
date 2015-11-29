class AnswerSetting < ActiveRecord::Base
  has_one :answer
  belongs_to :question
end