class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
    @restaurant = @user.restaurants
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.all
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.all
  end
end
