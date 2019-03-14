class FlatsController < ApplicationController
  def index
    flats = Flat.where.not(latitude: nil, longitude: nil)
    @flats = flats.where(available: true)
    @markers = create_marker(@flats)

    @rental_price = params[:rental_price]
    @size = params[:size]
    @location = params[:location]
    @radius = params[:radius]
    @bedrooms = params[:bedrooms]
    @ratings = params[:ratings]



    if @rental_price.present?
      @flats = @flats.where("rental_price <= ?", @rental_price)
      @markers = create_marker(@flats)
    end

    if @size.present?
      @flats = @flats.where("size >= ?", @size)
      @markers = create_marker(@flats)
    end

    if @location.present?
      @flats = @flats.near(@location, @radius)
      @markers = create_marker(@flats)
    end

    if @bedrooms.present?
      @flats = @flats.where("bedrooms >= ?", @bedrooms)
      @markers = create_marker(@flats)
    end

    if @ratings.present?
      @flats = @flats.select do |flat|
        flat.average_rating.to_i >= @ratings.to_i
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

    # RATING AVERAGES
    ratings = ratings_array(@flat, :rating)
    @average = average(ratings)
    # raise
    area_ratings = ratings_array(@flat, :area_rating)
    @area_average = average(area_ratings)

    landlord_ratings = ratings_array(@flat, :landlord_rating)
    @landlord_average = average(landlord_ratings)

    noise_ratings = ratings_array(@flat, :noise_rating)
    @noise_average = average(noise_ratings)

    plumbing_ratings = ratings_array(@flat, :plumbing_rating)
    @plumbing_average = average(plumbing_ratings)

    condition_ratings = ratings_array(@flat, :condition_rating)
    @condition_average = average(condition_ratings)

    energy_ratings = ratings_array(@flat, :energy_rating)
    @energy_average = average(energy_ratings)


    # MAPS
    @lived_close = @tenancies[:lived_close].map do |tenancy|
      id = tenancy.user_id
      name = User.find(id)
    end

    @markers = [
      {
        lng: @flat.longitude,
        lat: @flat.latitude
      }]

      @friend_markers_close = @tenancies[:lived_close].map do |t| {
        lng: Flat.find(t.flat_id).longitude,
        lat: Flat.find(t.flat_id).latitude,
        id: t.id
      }
    end

    @friend_markers_in = @tenancies[:lived_in].map do |t| {
      lng: Flat.find(t.flat_id).longitude,
      lat: Flat.find(t.flat_id).latitude,
      id: t.id
    }
  end
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

# def flat_average(flat)
#     final_rating = (flat.reviews[0].area_rating + flat.reviews[0].condition_rating
#       + flat.reviews[0].noise_rating + flat.reviews[0].plumbing_rating +
#       flat.reviews[0].energy_rating + flat.reviews[0].landlord_rating) / 6
#     return final_rating
#   end

def ratings_array(flat, rating_column)
  flat.reviews.map do |r|
    r.send rating_column
  end
end

def average(ratings)
  if ratings.count == 0
    average = 0
  else
    average_long = ratings.sum * 10 / ratings.count
    answer = average_long.round
    average = answer / 10.0
  end
  return average
end


def flat_params
  params.require(:flat).permit(:address)
end
end
