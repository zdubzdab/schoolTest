class AnswerSetting < ActiveRecord::Base
  has_one :answer
  belongs_to :question

  resourcify#rolify

  validates_presence_of :name, message: :blank_answer

end
