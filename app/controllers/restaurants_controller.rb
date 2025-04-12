class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :vote]

  # List all restaurants
  def index
    @restaurants = Restaurant.all
  end


  # Display the form to add a new restaurant
  def new
    @restaurant = Restaurant.new
  end

  # 4. Save the new restaurant to the database
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, notice: "Restaurant added successfully!"
    else
      render :new
    end
  end

  # Display the form to edit a restaurant
  def edit
  end

  # Update restaurant details
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurant updated successfully!"
    else
      render :edit
    end
  end

  # Search for restaurants by name or location
  def search
    query = params[:query]
    @restaurants = Restaurant.where("name LIKE ? OR location LIKE ?", "%#{query}%", "%#{query}%")
    render :index
  end

  # Handle voting
  def vote
    if params[:vote] == "will_split"
      @restaurant.increment!(:will_split_votes)
    elsif params[:vote] == "wont_split"
      @restaurant.increment!(:wont_split_votes)
    end
    redirect_to @restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :location)
  end
end
