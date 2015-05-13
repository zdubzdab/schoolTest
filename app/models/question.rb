class Question < ActiveRecord::Base
  has_many :anwer_settings, dependent: :destroy
  # has_many :settings, throught: :answer_settings

  validates_presence_of :text
end