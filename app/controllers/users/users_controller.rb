class Users::UsersController < ApplicationController
  def show
    if User.find(params[:id]) == current_user
      redirect_to profile_path
    else
      @user = User.find(params[:id])
      @artworks = Artwork.where(user: @user)
      @reviews = Review.where(reviewed: @user)
      @bookings = Booking.where(user: @user)
    end
  end
end
