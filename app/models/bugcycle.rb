class Bugcycle < ApplicationRecord
  
  has_many :suggestions
  
  belongs_to :user
  belongs_to :category

  validates :name, uniqueness: true

  mount_uploader :image, ImageUploader

  scope :search, -> search { where('name LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%") }

  def self.not_used(useds)
    ids = []

    useds.each do |used|
      ids << used.bugcycle_id
    end

    return where.not(id: ids)
  end
end
