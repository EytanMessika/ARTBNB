class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :artist_name
      t.string :type
      t.integer :price
      t.string :dimensions
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
