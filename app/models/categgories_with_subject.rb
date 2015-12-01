class CateggoriesWithSubject < ActiveRecord::Base
  belongs_to :subject
  belongs_to :categgory
  belongs_to :user

  resourcify#rolify

  class Entity < Grape::Entity
    expose :id
    # expose :user
    expose :categgory, using: Categgory::Entity
    expose :subject, using: Subject::Entity
  end
end