require "test_helper"

class VoteTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(email: "user#{rand(100000)}@example.com", password: "password")
    @restaurant = Restaurant.create!(name: "Sample Place", location: "Nowhere")
  end

  test "valid vote with proper vote_type" do
    vote = Vote.new(user: @user, restaurant: @restaurant, vote_type: "will_split")
    assert vote.valid?
  end

  test "invalid vote without vote_type" do
    vote = Vote.new(user: @user, restaurant: @restaurant)
    assert_not vote.valid?
  end

  test "invalid vote_type not in list" do
    vote = Vote.new(user: @user, restaurant: @restaurant, vote_type: "maybe")
    assert_not vote.valid?
  end

  test "user can only vote once per restaurant" do
    Vote.create!(user: @user, restaurant: @restaurant, vote_type: "will_split")
    duplicate_vote = Vote.new(user: @user, restaurant: @restaurant, vote_type: "wont_split")
    assert_not duplicate_vote.save
  end
end
