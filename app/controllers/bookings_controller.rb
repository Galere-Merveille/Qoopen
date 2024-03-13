class BookingsController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    if @booking.save!
      redirect_to space_path(@space)
      flash[:alert] = "Tu as bien réservé"
    else
      render "spaces/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
