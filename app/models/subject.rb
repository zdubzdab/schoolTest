class Subject < ActiveRecord::Base
  has_many :themes
  has_many :users
  has_many :categgories_with_subjects
  has_many :categgories, through: :categgories_with_subjects

  resourcify#rolify
  # TODO: remove relation table or found use case
  # has_and_belongs_to_many :users

  scope :for_klass, -> (categgory_id){ where('categgory_id = ?', categgory_id) }
end
