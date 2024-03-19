class RemoveStartDateFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :start_date, :date
  end
end
