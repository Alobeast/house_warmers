class ViewingsController < ApplicationController
  def index
    @viewings = Viewing.where("tenant_id = ? OR landlord_id = ?", current_user.id,current_user.id)
  end

  def create


    @viewing = Viewing.new(viewing_params)
    flat = Flat.find(params[:viewing][:flat_id].to_i)
    @viewing.flat = flat
    @viewing.landlord = @viewing.flat.landlord
    @viewing.tenant = current_user
    @viewing.save
    redirect_to viewings_path
  end

  private

  def viewing_params
    params.require(:viewing).permit(:message)
  end
end
