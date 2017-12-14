class Bugcycle < ApplicationRecord
  
  has_many :suggestions
  
  belongs_to :user
  belongs_to :category

  validates :name, uniqueness: true
  validates :description, length: { minimum: 10 }

  mount_uploader :image, ImageUploader

  scope :search, -> search { where('name LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%") }
end
