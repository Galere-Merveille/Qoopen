class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :space, null: false, foreign_key: true
      t.string :status, default: "Pending"
      t.datetime :start_date
      t.datetime :end_date
      t.float :total_amount

      t.timestamps
    end
  end
end
