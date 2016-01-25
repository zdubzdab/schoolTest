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

  resourcify#rolify

  accepts_nested_attributes_for :questions, allow_destroy: true

  scope :with_theme, ->(theme_id){ where(test_settings: {theme_id: theme_id} ) }
  scope :for_current_teacher, ->(user_id){ where(user_id: user_id ) }

  mount_uploader :video, VideoUploader

  validates_presence_of :name
  validates_presence_of :time_to_pass

  class Entity < Grape::Entity
    expose :id
    expose :max_tried_count
    expose :description
    expose :time_to_pass
    expose :theme #, using Theme::Entity
    expose :name
    expose :categgory, unless: lambda { |instance, options|  options[:env]["rack.request.query_hash"]["categgory_id"] unless options.blank? }
    expose :subject, unless: lambda { |instance, options|  options[:env]["rack.request.query_hash"]["subject_id"] unless options.blank? }
  end
end

# create_table "test_settings", force: :cascade do |t|
#     t.string   "complete_pers"
#     t.integer  "max_tried_count"
#     t.text     "description"
#     t.datetime "time_to_pass"
#     t.integer  "theme_id"
#     t.datetime "created_at",      null: false
#     t.datetime "updated_at",      null: false
#     t.string   "name"
#     t.integer  "categgory_id"
#     t.integer  "subject_id"
#   end
