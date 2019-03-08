class ViewingsController < ApplicationController
  def index
    @viewings = Viewing.all
  end

  def create
    @viewing = Viewing.new(viewing_params)
    @viewing.landlord = @viewing.flat.landlord
    @viewing.tenant = current_user
  end

  private

  def viewing_params
    params.require(:viewing).permit(:message)
  end
end
