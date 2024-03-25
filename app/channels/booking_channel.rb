class BookingChannel < ApplicationCable::Channel
  def subscribed
    booking = Booking.find(params[:id])
    stream_for booking
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
