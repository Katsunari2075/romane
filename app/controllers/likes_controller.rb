class LikesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_like

  def create
    user = current_user
    restaurant = Restaurant.find(params[:restaurant_id])
    if user_signed_in?
      like = Like.create(user_id: user.id, restaurant_id: restaurant.id)
    end
  end

  def destroy
    user = current_user
    restaurant = Restaurant.find(params[:restaurant_id])
    like = Like.find_by(user_id: user.id, restaurant_id: restaurant.id)
    if user_signed_in?
      like.delete
    end
  end

  private
  def set_like
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
