require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @restaurant = restaurants(:one)
    sign_in @user
  end

  test "should create comment" do
    assert_difference("Comment.count") do
      post restaurant_comments_url(@restaurant), params: { comment: { content: "Test comment" } }
    end
    assert_redirected_to restaurant_path(@restaurant)
  end
end
