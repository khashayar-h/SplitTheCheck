require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @restaurant = restaurants(:one)
    sign_in @user
  end

  test "should create favorite" do
    new_restaurant = Restaurant.create!(name: "Extra", location: "Testville")
    assert_difference("Favorite.count", 1) do
      post restaurant_favorite_url(new_restaurant)
    end
    assert_redirected_to restaurant_path(new_restaurant)
  end

  test "should destroy favorite" do
    assert_difference("Favorite.count", -1) do
      delete restaurant_favorite_url(@restaurant)
    end
    assert_redirected_to restaurant_path(@restaurant)
  end
end
