class FlatsController < ApplicationController
  def index
    @flats = Flat.where.not(latitude: nil, longitude: nil)
    @markers = create_marker(@flats)

    @rental_price = params[:rental_price]
    @size = params[:size]
    @location = params[:location]
    @rating = params[:rating]

    if @rental_price.present?
      @flats = @flats.where("rental_price <= ?", @rental_price)
      @markers = create_marker(@flats)
    end

    if @size.present?
      @flats = @flats.where("size >= ?", @size)
      @markers = create_marker(@flats)
    end

    if @location.present?
      @flats = @flats.near(@location, 5)
      @markers = create_marker(@flats)
    end

    if @rating.present?
      @flats = @flats.select do |flat|
        flat.average_rating.to_i >= @rating.to_i
      end
      @markers = create_marker(@flats)
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

  def create_marker(flats)
    flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude,
        id: flat.id
      }
    end
  end

  def flat_params
    params.require(:flat).permit(:address)
  end

end
