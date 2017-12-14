class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bugcycles
  has_many :suggestions
  has_many :useds

  as_enum :role, admin: 1, user: 0
end
