class ViewingsController < ApplicationController
  def index
    @viewings = Viewing.all
  end
end
