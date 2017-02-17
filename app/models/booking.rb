class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :artwork
  has_many :bookings
  validates :starts_on, presence: true
  validates :ends_on, presence: true

  def self.check_user(user)
  	@pendings = Booking.where(status: "Pending")
  	@pendings.each do |booking|
  		if booking.artwork.user == user
  			return true
  		end
  	return false
  	end
  end
end
