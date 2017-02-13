class BookingsController < ApplicationController

	def index
		@bookings = Booking.all
	end

	def create
		@artwork = Artwork.find(params[:artwork_id])
    @booking = Booking.new(booking_params)
    @booking.artwork = @artwork
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render "artworks/show"
    end
	end

	private

	def booking_params
    params.require(:booking).permit(:starts_on, :ends_on, :price)
  end
end