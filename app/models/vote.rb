class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :vote_type, inclusion: { in: %w[will_split wont_split up down] }
end
