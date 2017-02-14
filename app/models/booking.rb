class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :artwork
  has_many :bookings
  validates :price, presence: true
end
