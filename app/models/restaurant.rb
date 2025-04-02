class Restaurant < ApplicationRecord
    validates :name, presence: true, uniqueness: { scope: :location }
    validates :location, presence: true
  end
  