class Restaurant < ApplicationRecord
  has_many :votes, dependent: :destroy

  def will_split_votes
    votes.where(vote_type: 'will_split').count
  end

  def wont_split_votes
    votes.where(vote_type: 'wont_split').count
  end
  has_many :comments
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user
end
