class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
  end

  def create
    @artwork = Artwork.find(params[:artwork_id])
    @booking = Booking.new(booking_params)
    @booking.artwork = @artwork
    @booking.user = current_user
    @booking.status = "Pending"
    @booking.price = price_calculation(@booking.starts_on, @booking.ends_on, @artwork.price) unless @booking.starts_on == nil || @booking.ends_on == nil
    if @booking.save
      redirect_to dashboard_path
    else
      render "artworks/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path(tab: "bookings-tab")
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    @booking.status = "Confirmed"
    @booking.save
    redirect_to dashboard_path(tab: "bookings-tab")
  end

  def refuse_booking
    @booking = Booking.find(params[:id])
    @booking.status = "Refused"
    @booking.save
    redirect_to dashboard_path(tab: "bookings-tab")
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_on, :ends_on, :price, :user_id, :artwork_id, :status)
  end

  def price_calculation(starts_on, ends_on, daily_price)
    (ends_on - starts_on + 1) * daily_price || nil
  end
end
