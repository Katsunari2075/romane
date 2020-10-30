class RestaurantsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :new]
  before_action :move_to_index, only: :edit
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @restaurant.comments.includes(:user)
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @restaurant.destroy
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:store_name, :address, :genre_id, :rating_id, :description, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @restaurant = Restaurant.find(params[:id])
    redirect_to root_path unless current_user.id == @restaurant.user_id
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
