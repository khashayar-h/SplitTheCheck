require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should not save without content" do
    comment = Comment.new
    assert_not comment.save, "Saved the comment without content"
  end

  test "should belong to user and restaurant" do
    user = users(:one)
    restaurant = restaurants(:one)
    comment = Comment.new(content: "Nice!", user: user, restaurant: restaurant)
    assert comment.save
  end
end
