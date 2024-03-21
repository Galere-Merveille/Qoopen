class BookingDatesController < ApplicationController

  def create
    @space = Space.find(params[:space_id])
    selected_day_str = params.dig("booking_date", "selected_day")
    array_of_days = selected_day_str.split(", ") if selected_day_str
    array_of_days.each do |day|
      date = Date.parse(day)
      booking_date = BookingDate.create(selected_day: date, user_id: current_user.id, space_id: @space.id)
    end

    # selected_days = @space.booking_dates.where(user: current_user).where(booking: nil).pluck(:selected_day).sort
    # hash_of_periods = count_periods(selected_days)

    # number_of_months = hash_of_periods[:months]
    # number_of_weeks = hash_of_periods[:weeks]
    # number_of_isolated_days = hash_of_periods[:isolated_days]
    # total_amount = number_of_months * @space.price_per_month + number_of_weeks * @space.price_per_week + number_of_isolated_days * @space.price_per_day

    redirect_to space_path(@space)
  end

  private

  # def count_periods(dates)
  #   months_count = 0
  #   weeks_count = 0
  #   isolated_days_count = 0

  #   while dates.any?
  #     if dates.size >= 30 && (dates[29] - dates[0]).to_i == 29
  #       months_count += 1
  #       dates = dates.drop(30)
  #     elsif dates.size >= 7 && (dates[6] - dates[0]).to_i == 6
  #       weeks_count += 1
  #       dates = dates.drop(7)
  #     else
  #       isolated_days_count += 1
  #       dates = dates.drop(1)
  #     end
  #   end

  #   { months: months_count, weeks: weeks_count, isolated_days: isolated_days_count }
  # end

  def booking_date_params
    params.require(:booking_date).permit(:selected_day, :user_id, :space_id)
  end
end
