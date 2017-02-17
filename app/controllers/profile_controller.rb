class ProfileController < ApplicationController

def index
  @artworks = Artwork.where(user: current_user)
  @reviews = Review.where(reviewed: current_user)
  @avgreviews = calculate_avg_reviews
end
end

def calculate_avg_reviews
  somme = 0
  @reviews.each do |review|
    somme += review.rating
end
if @reviews.length != 0
  moyenne = somme/(@reviews.length)
else
  moyenne = 2
end
end
