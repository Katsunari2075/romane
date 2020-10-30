class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to restaurant_path(@comment.restaurant)
    else
      @restaurant = @comment.restaurant
      @comments = @restaurant.comments
      render 'restaurant/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, restaurant_id: params[:restaurant_id])
  end
end
