class MethodicalWork < ActiveRecord::Base

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :user

  METHODICAL_WORKS_PAGES = 20
end
