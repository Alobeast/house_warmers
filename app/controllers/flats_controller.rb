class FlatsController < ApplicationController
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

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  private

  def flat_params
    params.require(:flat).permit(:address)
  end
end
