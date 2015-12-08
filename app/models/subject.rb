class Subject < ActiveRecord::Base
  has_many :themes
  has_many :users

  resourcify#rolify
  # TODO: remove relation table or found use case
  # has_and_belongs_to_many :users

  scope :for_klass, -> (categgory_id){ where('categgory_id = ?', categgory_id) }

  class Entity < Grape::Entity
    expose :id
    expose :name
  end
end
