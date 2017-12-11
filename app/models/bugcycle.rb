class Bugcycle < ApplicationRecord
  validates :name, uniqueness: true

  mount_uploader :image, ImageUploader
end
