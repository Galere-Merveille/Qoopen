class BookingsController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    if @booking.save!
      duration = (@booking.end_date - @booking.start_date).to_i
      total_price = (@space.price_per_day * duration) / 86400
      @booking.update!(total_amount: total_price)
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
