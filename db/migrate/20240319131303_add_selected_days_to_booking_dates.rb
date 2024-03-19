class AddSelectedDaysToBookingDates < ActiveRecord::Migration[7.1]
  def change
    add_column :booking_dates, :selected_days, :string
  end
end
