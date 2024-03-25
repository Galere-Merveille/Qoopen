class SpacesController < ApplicationController
  before_action :set_space, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: [:index, :show, :results]

  # GET /spaces
  def index
    @spaces = Space.all
  end

  def results
    @spaces = Space.all
    if params[:space_profession].present?
      @spaces = @spaces.where(space_profession: params[:space_profession])
    end
    if params[:query].present?
      @spaces = @spaces.search_by_city(params[:query])
    end
    @markers = @spaces.geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {space: space})
      }
    end
  end

  # GET /spaces/1
  def show
    @booking = Booking.new
    # @booking.booking_dates.build
    @space_rating = SpaceRating.new
    @marker = { lat: @space.latitude, lng: @space.longitude }
    @bookings = @space.bookings
    @booking_date = BookingDate.new
    @selected_days = @space.booking_dates.where(user: current_user).where(booking: nil).pluck(:selected_day).sort.uniq
    hash_of_periods = count_periods(@selected_days)

    @number_of_months = hash_of_periods[:months]
    @number_of_weeks = hash_of_periods[:weeks]
    @number_of_isolated_days = hash_of_periods[:isolated_days]
    @total_amount = @number_of_months * @space.price_per_month + @number_of_weeks * @space.price_per_week + @number_of_isolated_days * @space.price_per_day
  end

  # GET /spaces/new
  def new
    @space = Space.new
  end

  # GET /spaces/1/edit
  def edit
  end

  # POST /spaces
  def create
    @space = Space.new(space_params)
    @space.user = current_user

    if @space.save
      redirect_to space_path(@space), notice: "Space was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spaces/1
  def update
    if @space.update(space_params)
      redirect_to @space, notice: "Space was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /spaces/1
  def destroy
    @space.destroy
    redirect_to root_path, notice: "Space was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_space
    @space = Space.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def space_params
    params.require(:space).permit(:city, :address, :space_profession, :description, :price_per_day, :price_per_week, :price_per_month, photos: [])
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
