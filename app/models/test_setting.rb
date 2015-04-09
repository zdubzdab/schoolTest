class TestSetting < ActiveRecord::Base
  has_one :test

  scope :with_theme, ->(theme_id){ where(test_settings: {theme_id: theme_id} ) }
end