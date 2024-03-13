class SpaceRatingsController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    @space_rating = SpaceRating.new(space_rating_params)
    @space_rating.space = @space
    @space_rating.user = current_user
    if @space_rating.save!
      redirect_to space_path(@space)
    else
      render "spaces/show", status: :unprocessable_entity
    end
  end

  private

  def space_rating_params
    params.require(:space_rating).permit(:comment, :rating)
  end
end
