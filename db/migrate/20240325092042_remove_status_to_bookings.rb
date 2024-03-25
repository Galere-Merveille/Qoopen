class RemoveStatusToBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :status
  end
end
