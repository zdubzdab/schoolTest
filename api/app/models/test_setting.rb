class TestSetting < ActiveRecord::Base
  has_many :tests
  has_many :questions

  accepts_nested_attributes_for :questions

  scope :with_theme, ->(theme_id){ where(test_settings: {theme_id: theme_id} ) }
end