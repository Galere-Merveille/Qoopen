class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_many :booking_dates

  # def self.calculate_total_amount
  #   #todo: calculate total_amount
  #   booking_dates.sum(total)
  #   return results
  # end

  # def total_booking_with_calculated_amount
  #   where.not(total_amount:  nil)
  # end
end
