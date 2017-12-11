class Bugcycle < ApplicationRecord
  validates :name, uniqueness: true
end
