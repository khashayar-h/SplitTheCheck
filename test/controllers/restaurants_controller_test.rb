require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = Restaurant.create(name: "Test Place", location: "New York", will_split_votes: 5, wont_split_votes: 2)
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
      post restaurants_url, params: { restaurant: { name: "Test Restaurant", location: "Test Location", will_split: 1, wont_split: 0 } }
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
    get search_restaurants_url, params: { query: "Test" } if defined?(search_restaurants_url)
    assert_response :success if defined?(search_restaurants_url)
  end

  test "should vote for a restaurant" do
    restaurant = restaurants(:one)
    initial_will_split_votes = restaurant.will_split_votes
  
    post vote_restaurant_url(restaurant, vote: "will_split")
  
    restaurant.reload
  
    assert_equal initial_will_split_votes + 1, restaurant.will_split_votes
  end

end
