class Comment < ActiveRecord::Base
  belongs_to :user

  ADMIN_COMMENTS_INDEX_PAGES = 5

  validates :name, presence: true
  validates :text, presence: true
end
