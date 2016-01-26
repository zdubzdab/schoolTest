class Tiding < ActiveRecord::Base

  resourcify#rolify

  WELCOME_INDEX_PAGES = 5

  def self.search(query)
    where("lower(title) like ?", "%#{query.downcase}%")
  end

  validates :title, presence: true,
                    length: { minimum: 3 },
                    uniqueness: true
  validates :text, presence: true

end
