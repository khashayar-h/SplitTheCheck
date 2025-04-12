class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :vote_type, inclusion: { in: %w[up down] }
end
