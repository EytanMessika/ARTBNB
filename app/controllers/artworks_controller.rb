class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @artworks = Artwork.all
    if params[:search]
      @artworks = Artwork.search(params[:search])
    end
    if params[:search_price] != ""
      @artworks = @artworks.where("price < ?", params[:search_price])
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    # @artwork_coordinates = { lat: @artwork.latitude, lng: @artwork.longitude }
    @booking = Booking.new()

    @hash = Gmaps4rails.build_markers([ @artwork ]) do |artwork, marker|
      marker.lat artwork.latitude
      marker.lng artwork.longitude
    end
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    if @artwork.save
      redirect_to dashboard_path(tab: "my-artworks-tab")
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
      redirect_to dashboard_path(tab: "my-artworks-tab")
    else
      render :edit
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to dashboard_path(tab: "my-artworks-tab")
  end

  def mine
    @artworks = Artwork.where(user: current_user)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :artist_name, :category, :price,
    :dimensions, :user_id, :photo, :photo_cache, :address)
  end
end
