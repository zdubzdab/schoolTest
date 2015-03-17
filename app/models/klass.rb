class Klass < ActiveRecord::Base
  has_many :subjects

  validates_presence_of :name
end
