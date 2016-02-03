class Question < ActiveRecord::Base
  has_many :answer_settings, dependent: :destroy
  belongs_to :test_setting

  resourcify#rolify

  validates_presence_of :text, message: :blank_question

  accepts_nested_attributes_for :answer_settings, allow_destroy: true
end
