class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :space_ratings, dependent: :destroy
  has_many_attached :photos

  validates :photos, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
