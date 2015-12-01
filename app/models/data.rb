class Data < ActiveRecord::Base
  mount_uploaders :avatars, AvatarUploader

  resourcify#rolify
end
