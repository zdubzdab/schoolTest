class Categgory < ActiveRecord::Base
  # TODO: remove relation table
  # has_many :subjects
  has_many :users
  has_many :categgories_with_subjects
  has_many :subjects, through: :categgories_with_subjects

  resourcify#rolify

  validates_presence_of :name

  class Entity < Grape::Entity
    expose :id
    expose :name
  end
end
