require "test_helper"
puts "Devise mappings: #{Devise.mappings.inspect}"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @restaurant = Restaurant.create!(name: "Test Place", location: "New York")
    @user = User.create!(email: "user#{rand(1000)}@example.com", password: "password")
    sign_in_as(@user)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
    assert_select "h1", "Split The Check"
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
    assert_select "h1", @restaurant.name
  end

  test "should get new restaurant form" do
    get new_restaurant_url
    assert_response :success
    assert_select "form"
  end

  test "should create restaurant and redirect to index" do
    assert_difference('Restaurant.count', 1) do
      post restaurants_url, params: { restaurant: { name: "Test Restaurant", location: "Test Location" } }
    end
    assert_redirected_to restaurants_path
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
    assert_select "form"
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { name: "Updated Name" } }
    assert_redirected_to restaurant_url(@restaurant)
    @restaurant.reload
    assert_equal "Updated Name", @restaurant.name
  end

  test "should search for a restaurant" do
    get search_restaurants_url, params: { query: "Test" }
    assert_response :success
  end

  test "should vote for a restaurant" do
    assert_difference('Vote.count', 1) do
      post restaurant_votes_path(@restaurant), params: { vote_type: "will_split" }
    end
    assert_redirected_to restaurant_path(@restaurant)
  end
end
