class Category < ApplicationRecord
  has_many :bugcycles
  has_many :suggestion
end
