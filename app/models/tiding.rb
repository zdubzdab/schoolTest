class Tiding < ActiveRecord::Base
  mount_uploaders :avatars, AvatarUploader

  resourcify#rolify
end
