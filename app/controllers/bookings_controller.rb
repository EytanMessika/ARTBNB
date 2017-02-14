class BookingsController < ApplicationController

	def index
		@bookings = Booking.where(user: current_user)
	end

	def create
		@artwork = Artwork.find(params[:artwork_id])
    @booking = Booking.new(booking_params)
    @booking.artwork = @artwork
    @booking.user = current_user
    @booking.price = price_calculation(@booking.starts_on, @booking.ends_on, @artwork.price)
    if @booking.save
      redirect_to artwork_bookings_path(@artwork)
    else
      render "artworks/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_on, :ends_on)
  end

  def price_calculation(starts_on, ends_on, daily_price)
    (ends_on - starts_on + 1) * daily_price
  end
end