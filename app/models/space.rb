class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :space_ratings, dependent: :destroy
  has_many_attached :photos
end
