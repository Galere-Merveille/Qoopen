class BookingsController < ApplicationController
  def create
    raise
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
