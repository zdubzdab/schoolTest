class Test < ActiveRecord::Base
  belongs_to :test_setting
  belongs_to :user
  has_one :theme, through: :test_setting

  resourcify#rolify
end
