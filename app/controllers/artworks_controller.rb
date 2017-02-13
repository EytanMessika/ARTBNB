class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    if @artwork.save
      redirect_to mine_path
    else
      render :new
    end
  end

  def mine
    @artworks = Artwork.where(user_id = current_user)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :artist_name, :type, :price,
    :dimensions, :user_id)
  end
end
