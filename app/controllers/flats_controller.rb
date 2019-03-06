class FlatsController < ApplicationController
  def index
    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude
      }
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    @flat.save
  end

  def show
    @flat = Flat.find(params[:id])
    @viewing = Viewing.new(flat: @flat)
    @marker =
      {
        lng: @flat.longitude,
        lat: @flat.latitude
      }
  end

  private

  def flat_params
    params.require(:flat).permit(:address)
  end
end
