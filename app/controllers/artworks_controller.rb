class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @artwork = Artwork.find(params[:id])
    @booking = Booking.new()
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    if @artwork.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      redirect_to artwork_path(@artwork)
    else
      render :edit
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to dashboard_path
  end

  def mine
    @artworks = Artwork.where(user: current_user)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :artist_name, :category, :price,
    :dimensions, :user_id, :photo, :photo_cache)
  end
end
