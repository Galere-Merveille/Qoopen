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
  end

  private

  def set_user
    @user = current_user
  end

  def space_params
  end
end
