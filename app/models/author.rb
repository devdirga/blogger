class Author < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :subscriptions, dependent: :destroy
end
