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
    @tenancies = current_user.friend_tenancies_near(@flat)
    @lived_in = @tenancies[:lived_in].map do |tenancy|
      id = tenancy.user_id
      name = User.find(id)
    end

    @lived_close = @tenancies[:lived_close].map do |tenancy|
      id = tenancy.user_id
      name = User.find(id)
    end

    @markers = [
      {
        lng: @flat.longitude,
        lat: @flat.latitude
      }]
  end

  private

  def flat_params
    params.require(:flat).permit(:address)
  end

end
