class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @space = Space.find(params[:space_id])

    @booking.update(space: @space, user: current_user)

    @booking_dates_ids = params[:booking][:booking_dates]
    @booking_dates = BookingDate.where(id: @booking_dates_ids)
    @booking_dates.each do |booking_date|
      booking_date.update(booking: @booking)
    end
    raise
    # Faire un redirect_to vers une vue
  end

  private

  def booking_params
    params.require(:booking).permit(:total_amount)
  end
end
