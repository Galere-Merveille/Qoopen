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
    redirect_to bookings_dashboards_path
  end

  def update
    booking = Booking.find(params[:id])
    if params[:value] == "accepter"
      booking.accepted!
      flash[:notice] = "Réservation acceptée"
    elsif params[:value] == "refuser"
      booking.rejected!
      flash[:alert] = "Réservation refusée"
    else
      flash[:alert] = "Problème !"
    end
    redirect_to owner_dashboards_path
  end


  #   # if @booking.update(status: params[:status])
  #   #   render json: { message: "Statut mis à jour avec succès" }
  #   # else
  #   #   render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
  #   # end
  # end



  # link_to "accepter"  update_status_path(value: "accepter")
  # link_to "refuser"  update_status_path(value: "refuser")

  private

  def booking_paramss
    params.require(:booking).permit(:total_amount, :status)
  end

  def calculate_total_amount
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
    total_price = @space.price_per_month * months_count + @space.price_per_week * weeks_count + @space.price_per_day * isolated_days_count
  end
end
