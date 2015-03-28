class Test < ActiveRecord::Base
  belongs_to :test_setting
  belongs_to :user

  scope :with_theme, ->(theme_id){ where(theme_id: theme_id)}
end
