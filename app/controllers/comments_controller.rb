class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @restaurant, notice: "Comment posted successfully."
    else
      redirect_to @restaurant, alert: "Failed to post comment."
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @restaurant = @comment.restaurant
    @comment.destroy
    redirect_to @restaurant, notice: "Comment deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
