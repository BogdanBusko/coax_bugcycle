class Suggestion < ApplicationRecord
  belongs_to :bugcycle
  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader
end
