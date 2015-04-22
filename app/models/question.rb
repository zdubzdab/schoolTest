class Question < ActiveRecord::Base
  has_many :anwer_settings
  # has_many :settings, throught: :answer_settings
end