class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_many :booking_dates, dependent: :destroy
  has_many :messages, dependent: :destroy

  # accepts_nested_attributes_for :booking_dates
  enum :status, { pending: 0, accepted: 1, rejected: 2, archived: 3 }

  def start_at
    booking_dates.order(:selected_day).first
  end

  def end_at
    booking_dates.order(:selected_day).last.selected_day
  end

  def self.archive
    find_each do |booking|
      booking.archived! if booking.end_at < Date.today
    end
  end
end
