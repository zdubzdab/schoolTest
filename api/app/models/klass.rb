class Klass < ActiveRecord::Base
  has_many :subjects
  has_many :users

  validates_presence_of :name

  class Entity < Grape::Entity
    expose :id
    expose :name
  end

end
