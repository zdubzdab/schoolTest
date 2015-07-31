class Subject < ActiveRecord::Base
  has_many :themes

  # hook for grape serialize
  # belongs_to :categgory, class_name: 'Klass', foreign_key: 'klass_id'

  # TODO: remove relation table or found use case
  # has_and_belongs_to_many :users

  scope :for_klass, -> (klass_id){ where('klass_id = ?', klass_id) }

  class Entity < Grape::Entity
    expose :id
    expose :name
  end
end
