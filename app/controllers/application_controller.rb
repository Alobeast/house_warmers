class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  # the following overrides Rails.application.default_url_options[:host]
  HOST = "www.nested.live"
  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end
