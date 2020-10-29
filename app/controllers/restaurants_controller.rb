class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    unless current_user.id == @restaurant.user_id
      redirect_to restaurant_path
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path
    else
      render :edit
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    if restaurant.destroy
      redirect_to root_path
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:store_name, :address, :genre_id, :rating_id, :description, :image).merge(user_id: current_user.id)
  end
end
