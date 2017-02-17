class AddDescriptionToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :description, :text
  end
end
