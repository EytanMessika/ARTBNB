class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :artwork
  has_many :bookings
  has_one :review
  validates :starts_on, presence: true
  validates :ends_on, presence: true
end
