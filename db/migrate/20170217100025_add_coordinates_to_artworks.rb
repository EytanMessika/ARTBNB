class AddCoordinatesToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :address, :string
    add_column :artworks, :latitude, :float
    add_column :artworks, :longitude, :float
  end
end
