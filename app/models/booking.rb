class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_many :booking_dates
  accepts_nested_attributes_for :booking_dates

  # def calculate_total_amount
  #   total = 0
  #   duration_in_days = (self.booking_date.max.to_date - self.booking_date.min.to_date).to_i + 1
end
