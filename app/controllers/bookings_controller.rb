class BookingsController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    total_amount = calculate_total_amount
    @booking = Booking.create(total_amount: total_amount)
    @booking.update(space: @space, user: current_user)

    @booking_dates = @space.booking_dates.where(user: current_user).where(booking: nil)

    @booking_dates.each do |booking_date|
      booking_date.update(booking: @booking)
    end
    flash[:notice] = "Votre réservation a bien été prise en compte"
    redirect_to space_booking_path(@booking.space, @booking)
  end

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new
    @messages = @booking.messages
    @selected_days = @booking.booking_dates.pluck(:selected_day)
    hash_of_periods = count_periods(@selected_days)
    @number_of_months = hash_of_periods[:months]
    @number_of_weeks = hash_of_periods[:weeks]
    @number_of_isolated_days = hash_of_periods[:isolated_days]
  end

  def update
    booking = Booking.find(params[:id])
    if params[:value] == "accepter"
      booking.accepted!
      flash[:notice] = "Votre réservation vient d'être acceptée"
    elsif params[:value] == "refuser"
      booking.rejected!
      flash[:alert] = "Votre réservation vient d'être refusée"
    else
      flash[:alert] = "Il y a eu un problème !"
    end
    redirect_to owner_dashboards_path
  end


  def archive_booking
    Booking.archive
  end


  private

  def booking_params
    params.require(:booking).permit(:total_amount, :status)
  end

  def calculate_total_amount
    dates = @space.booking_dates.where(user: current_user).where(booking: nil).pluck(:selected_day).sort
    months_count = 0
    weeks_count = 0
    isolated_days_count = 0

    while dates.any?
      if dates.size >= 30 && (dates[29] - dates[0]).to_i == 29
        months_count += 1
        dates = dates.drop(30)
      elsif dates.size >= 7 && (dates[6] - dates[0]).to_i == 6
        weeks_count += 1
        dates = dates.drop(7)
      else
        isolated_days_count += 1
        dates = dates.drop(1)
      end
    end

    total_price = (@space.price_per_month * months_count) + (@space.price_per_week * weeks_count) + (@space.price_per_day * isolated_days_count)
    total_price_with_taxes = (total_price + (total_price * 0.10)).to_i
  end

  def count_periods(dates)
    months_count = 0
    weeks_count = 0
    isolated_days_count = 0

    while dates.any?
      if dates.size >= 30 && (dates[29] - dates[0]).to_i == 29
        months_count += 1
        dates = dates.drop(30)
      elsif dates.size >= 7 && (dates[6] - dates[0]).to_i == 6
        weeks_count += 1
        dates = dates.drop(7)
      else
        isolated_days_count += 1
        dates = dates.drop(1)
      end
    end

    { months: months_count, weeks: weeks_count, isolated_days: isolated_days_count }
  end
end
