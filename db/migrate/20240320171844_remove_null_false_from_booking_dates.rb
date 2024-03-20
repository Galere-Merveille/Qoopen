class RemoveNullFalseFromBookingDates < ActiveRecord::Migration[7.1]
  def change
    change_column_null :booking_dates, :booking_id, true
  end
end
