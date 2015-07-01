class Klass < ActiveRecord::Base
  has_many :subjects
  has_many :users

  validates_presence_of :name
end
