class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :vote_type, inclusion: { in: %w[will_split wont_split up down] }
  validates :user_id, uniqueness: { scope: :restaurant_id, message: "can only vote once per restaurant" }

end
