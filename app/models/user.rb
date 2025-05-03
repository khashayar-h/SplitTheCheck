class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :votes
  has_many :comments
  has_many :favorites
  has_many :favorite_restaurants, through: :favorites, source: :restaurant
end
