
class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    vote = @restaurant.votes.find_or_initialize_by(user: current_user)
    vote.vote_type = params[:vote_type]

    if vote.save
      flash[:notice] = "Your vote was recorded."
    else
      flash[:alert] = "Could not record your vote."
    end

    redirect_to restaurant_path(@restaurant)
  end
end
