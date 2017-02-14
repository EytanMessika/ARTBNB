class DashboardController < ApplicationController
  def index
     @artworks = Artwork.where(user: current_user)
     @bookings = Booking.where(user: current_user)
     @bookings_on_my_artworks = bookings_on_user_artworks
  end

  private

  def bookings_on_user_artworks
    Booking.all.select {|booking| current_user.artworks.include? booking.artwork}
  end
end
