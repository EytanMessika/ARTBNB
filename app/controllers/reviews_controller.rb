class ReviewsController < ApplicationController
  def index
    @reviews_received = Review.where(reviewed: current_user)
    @reviews_given = Review.where(reviewer: current_user)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reviewer = current_user
    @review.reviewed = User.find(params[:user_id])
    @review.save
  end


  private
  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
