class SpacesController < ApplicationController
  before_action :set_space, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /spaces
  def index
    @spaces = Space.all
    if params[:query].present?
      @spaces = @spaces.search_by_city_and_address(params[:query])
    end
  end

  # GET /spaces/1
  def show
    @booking = Booking.new
    @space_rating = SpaceRating.new
    @marker = { lat: @space.latitude, lng: @space.longitude }
    # raise
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
    @space.destroy!
    redirect_to spaces_url, notice: "Space was successfully destroyed.", status: :see_other
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
end
