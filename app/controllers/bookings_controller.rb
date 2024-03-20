class BookingsController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    selected_day_str = params.dig("booking", "booking_dates_attributes", "0", "selected_day")
    array_of_days = selected_day_str.split(", ") if selected_day_str
    array_of_days.each do |day|
      date = Date.parse(day)
      booking_date = BookingDate.create(selected_day: date)
      booking_date.booking = @booking
      booking_date.save
    end

    hash_of_periods = count_periods(array_of_days)
    total_amount = (hash_of_periods[:months] * @space.price_per_month) + (hash_of_periods[:weeks] * @space.price_per_week) + (hash_of_periods[:isolated_days] * @space.price_per_day)

    @booking.total_amount = total_amount

    redirect_to space_path(@space)
  end

  private

  def count_periods(dates_str)
    # Conversion et tri des dates
    dates = dates_str.map { |date_str| Date.parse(date_str) }.sort

    months_count = 0
    weeks_count = 0
    isolated_days_count = 0

    while dates.any?
      # Vérification des mois complets (30 jours consécutifs)
      if dates.size >= 30 && (dates[29] - dates[0]).to_i == 29
        months_count += 1
        dates = dates.drop(30) # Supprime les 30 jours du début
      # Vérification des semaines complètes (7 jours consécutifs)
      elsif dates.size >= 7 && (dates[6] - dates[0]).to_i == 6
        weeks_count += 1
        dates = dates.drop(7) # Supprime les 7 jours du début
      else
        isolated_days_count += 1
        dates = dates.drop(1) # Supprime le jour isolé du début
      end
    end

    { months: months_count, weeks: weeks_count, isolated_days: isolated_days_count }
  end

  def booking_params
    params.require(:booking).permit(:status)
  end
end
