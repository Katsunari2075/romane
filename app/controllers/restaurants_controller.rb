class RestaurantsController < ApplicationController
  def index
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:store_name, :address, :genre_id, :rating_id, :description, :image).merge(user_id: current_user.id)
  end
end
