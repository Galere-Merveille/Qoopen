class RemoveSelectedDaysFromBookingDates < ActiveRecord::Migration[7.1]
  def change
    remove_column :booking_dates, :selected_days, :string
  end
end
