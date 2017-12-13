class Bugcycle < ApplicationRecord
  
  has_many :suggestions
  
  belongs_to :user
  belongs_to :category

  validates :name, uniqueness: true

  mount_uploader :image, ImageUploader
end
