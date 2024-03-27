class DashboardsController < ApplicationController
  def index
  end

  def infos
  end

  def bookings
  end

  def favoris
  end

  def new_wishspace
    @space = Space.new
  end

  def create_wishspace
    @space = Space.new
  end

  def wishspace
  end

  def owner
    @owner_bookings = Booking.joins(:space).where(spaces: { user: current_user})
    @sorted_bookings = @owner_bookings.sort_by { |booking| booking.start_at }
    @pendings = @owner_bookings.where(status: "pending")
    @accepted = @owner_bookings.where(status: "accepted")
    @rejected = @owner_bookings.where(status: "rejected")
    @archived = @owner_bookings.where(status: "archived")
  end

  private

  def set_user
    @user = current_user
  end

  def space_params
  end
end
