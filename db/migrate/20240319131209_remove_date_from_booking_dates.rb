class RemoveDateFromBookingDates < ActiveRecord::Migration[7.1]
  def change
    remove_column :booking_dates, :date, :date
  end
end
