class Subject < ActiveRecord::Base
  has_many :themes
  belongs_to :klass

  scope :for_klass, -> (klass_id){ where('klass_id = ?', klass_id) }
end
