class Test < ActiveRecord::Base
  belongs_to :test_setting
  belongs_to :user
  delegate :theme_id, :description,  to: :test_setting
end
