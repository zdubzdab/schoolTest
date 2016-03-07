class CateggoriesWithSubject < ActiveRecord::Base
  belongs_to :subject
  belongs_to :categgory
  belongs_to :user

  resourcify#rolify
end
