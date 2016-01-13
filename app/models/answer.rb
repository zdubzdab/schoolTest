class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer_setting
  belongs_to :test

  resourcify#rolify
end
