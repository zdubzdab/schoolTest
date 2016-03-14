class Tiding < ActiveRecord::Base

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  resourcify#rolify

  WELCOME_INDEX_PAGES = 5

  def self.search(query)
    where("lower(title) like ?", "%#{query.downcase}%")
  end

  validates :title, presence: true,
                    length: { minimum: 3 },
                    uniqueness: true
  validates :text, presence: true

  scope :main, -> { where(main: 'true' ) }

end
