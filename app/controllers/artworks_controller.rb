class ArtworksController < ApplicationController
  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = @user
    if @artwork.save
      redirect_to my_artworks_path(@user)
    else
      render :new
    end
  end

  def mine

  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :artist_name, :type, :price,
    :dimensions, :user_id)
  end
end
