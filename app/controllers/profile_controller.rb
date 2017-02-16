class ProfileController < ApplicationController

def index
  @artworks = Artwork.where(user: current_user)
end
end
