class Artwork < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :artist_name, presence: true
  validates :category, presence: true
  validates :dimensions, presence: true
  validates :price, presence: true
  validates :photo, presence: true
end
