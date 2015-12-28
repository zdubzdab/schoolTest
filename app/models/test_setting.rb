class TestSetting < ActiveRecord::Base
  has_many :users, through: :tests
  has_many :tests
  has_many :questions
  belongs_to :subject
  belongs_to :categgory
  belongs_to :theme
  belongs_to :user

  TEACHER_TESTSETTING_INDEX_PAGES = 10
  TEACHER_TESTSETTING_SHOW_PAGES = 20

  TEACHER_TESTSETTING_INDEX_PAGES = 10

  resourcify#rolify

  accepts_nested_attributes_for :questions, allow_destroy: true

  scope :with_theme, ->(theme_id){ where(test_settings: {theme_id: theme_id} ) }
  scope :for_current_teacher, ->(user_id){ where(user_id: user_id ) }

  mount_uploaders :videos, VideoUploader
  mount_uploaders :files, FileUploader

  validates_presence_of :name
  validates_presence_of :time_to_pass
end
