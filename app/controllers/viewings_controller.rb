class ViewingsController < ApplicationController
  def index
    @viewings = Viewing.all
  end

  def create
    @viewing = Viewing.new(viewing_params)
    @viewing.landlord = @viewing.flat.landlord
    @viewing.tenant = current_user
  end
end
