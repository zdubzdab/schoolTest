class Theme < ActiveRecord::Base
  belongs_to :subject
  has_many :tests

  scope :for_subject, -> (subject_id){ where('subject_id = ?', subject_id) }
end
