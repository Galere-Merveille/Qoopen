class BookingDatesController < ApplicationController
  before_action :set_booking_date, only: :destroy

  def create
    @space = Space.find(params[:space_id])
    selected_day_str = params.dig("booking_date", "selected_day")
    if params[:value] == "range"
      array_of_days = selected_day_str.split(" to ") if selected_day_str
      start_date = Date.parse(array_of_days[0])
      end_date = Date.parse(array_of_days[1])
      array_of_days = (start_date..end_date).to_a
    else
      array_of_days = selected_day_str.split(", ") if selected_day_str
      array_of_days.map { |day| Date.parse(day) }
    end
    array_of_days.each do |day|
      booking_date = BookingDate.create(selected_day: day, user_id: current_user.id, space_id: @space.id)
    end
    redirect_to space_path(@space)
  end

  def destroy
    @space = @booking_date.space
    @booking_date.destroy
    @selected_days_collection = @space.booking_dates.where(user: current_user).where(booking: nil).sort.uniq
    respond_to do |format|
      format.text { render partial: "shared/list", locals: { selected_days_collection: @selected_days_collection }, formats: [:html] }
    end
  end

  private

  def set_booking_date
    @booking_date = BookingDate.find(params[:id])
  end

  def booking_date_params
    params.require(:booking_date).permit(:selected_day, :user_id, :space_id)
  end
end
