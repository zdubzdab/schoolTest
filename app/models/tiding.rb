class Tiding < ActiveRecord::Base

  resourcify#rolify

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  validates :title, presence: true,
                    length: { minimum: 3 },
                    uniqueness: true
  validates :text, presence: true

end
