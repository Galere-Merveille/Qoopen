class BookingDatesController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    selected_day_str = params.dig("booking_date", "selected_day")
    array_of_days = selected_day_str.split(", ") if selected_day_str
    array_of_days.each do |day|
      date = Date.parse(day)
      booking_date = BookingDate.create(selected_day: date, user_id: current_user.id, space_id: @space.id)
    end
    redirect_to space_path(@space)
  end

  private

  def booking_date_params
    params.require(:booking_date).permit(:selected_day, :user_id, :space_id)
  end
end
