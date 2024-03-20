class BookingsController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    array_of_days = params.dig("booking", "total_amount").split(", ")
    array_of_days.each do |day|
      date = Date.parse(day)
      booking_date = BookingDate.create(selected_day: date)
      booking_date.booking = @booking
      booking_date.save
    end

    # @total_amount = @booking.caclulate_total_amount

  end
  #  calculate price à partir de @booking.booking_date


  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
