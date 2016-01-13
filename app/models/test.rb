class Test < ActiveRecord::Base
  belongs_to :test_setting
  belongs_to :user
  has_one :theme, through: :test_setting
  has_many :answers

  accepts_nested_attributes_for :answers

  resourcify#rolify
end
