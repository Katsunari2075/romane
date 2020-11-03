class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
    @restaurant = @user.restaurants
  end
end
