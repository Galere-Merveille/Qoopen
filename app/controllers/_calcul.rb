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
    if booking_date.save
      if array_of_days
      else
      end
    else
    end
  end
end


total = 0
duration =
same_month = date[1]
if same_month == 0
  total =
