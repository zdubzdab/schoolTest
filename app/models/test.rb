class Test < ActiveRecord::Base
  belongs_to :theme

  scope :with_theme, ->(theme_id){ where(theme_id: theme_id)}
end
