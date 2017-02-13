class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :starts_on
      t.date :ends_on
      t.integer :price
      t.references :user, foreign_key: true
      t.references :artwork, foreign_key: true

      t.timestamps
    end
  end
end
