class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to user_path(@booking.user)
    else
      render 'users/show'
    end
  end


  private
  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
