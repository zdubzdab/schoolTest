class Theme < ActiveRecord::Base
  belongs_to :subject
  has_many :test_settings
  has_many :tests, through: :test_settings

  resourcify#rolify

  scope :for_subject, -> (subject_id){ where('subject_id = ?', subject_id) }

end
