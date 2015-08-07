class Subject < ActiveRecord::Base
  has_many :themes


  # TODO: remove relation table or found use case
  # has_and_belongs_to_many :users

  scope :for_klass, -> (klass_id){ where('klass_id = ?', klass_id) }

  class Entity < Grape::Entity
    expose :id
    expose :name
  end
end
