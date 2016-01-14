class TestSetting < ActiveRecord::Base
  has_many :tests
  has_many :questions
  belongs_to :subject
  belongs_to :categgory
  belongs_to :theme

  TEACHER_TESTSETTING_INDEX_PAGES = 10

  resourcify#rolify

  accepts_nested_attributes_for :questions, allow_destroy: true

  scope :with_theme, ->(theme_id){ where(test_settings: {theme_id: theme_id} ) }

  mount_uploaders :videos, VideoUploader
  mount_uploaders :files, FileUploader

  validates_presence_of :name
  validates_presence_of :time_to_pass
end
