class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_many :booking_dates, dependent: :destroy
  has_many :messages, dependent: :destroy
  # accepts_nested_attributes_for :booking_dates
end
