class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.tenant = current_user
    @flats = Flat.where(address: params[:review][:address])

    @review.flat_id = @flats.first.id if !@flats.blank?
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:address, :area_rating, :noise_rating, :condition_rating, :energy_rating, :landlord_rating, :plumbing_rating, :comment)
  end
end
