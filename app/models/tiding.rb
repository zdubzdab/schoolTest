class Tiding < ActiveRecord::Base

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

end
