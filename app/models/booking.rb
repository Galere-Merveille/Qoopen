class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_many :booking_dates, dependent: :destroy
  # accepts_nested_attributes_for :booking_dates
  enum :status, { pending: 0, accepted: 1, rejected: 2, archived: 3 }


  def start_at
    booking_dates.order(:selected_day).first.selected_day
  end
end
