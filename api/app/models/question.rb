class Question < ActiveRecord::Base
  has_many :answer_settings, dependent: :destroy
  belongs_to :test_setting
  # has_many :settings, throught: :answer_settings

  validates_presence_of :text
end