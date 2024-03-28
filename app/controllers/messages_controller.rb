class MessagesController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user
    if @message.save
      BookingChannel.broadcast_to(
        @booking,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
      # redirect_to space_booking_path(@booking.space, @booking)
    else
      render "booking/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
