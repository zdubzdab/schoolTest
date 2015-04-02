class Test < ActiveRecord::Base
  belongs_to :test_setting
  belongs_to :user
  delegate :theme_id, :description,  to: :test_setting

  scope :with_theme, ->(theme_id){ joins(:test_setting).where(test_settings: {theme_id: theme_id} ) }
end
