class CreateBookingDates < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_dates do |t|
      t.date :date
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
