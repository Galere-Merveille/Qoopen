class AddUserToBookingDates < ActiveRecord::Migration[7.1]
  def change
    add_reference :booking_dates, :user, foreign_key: true
    add_reference :booking_dates, :space, foreign_key: true
  end
end
