class BookingDate < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :space
  belongs_to :user
end
