Koala.configure do |config|
  config.access_token = ENV["MY_TOKEN"]
  config.app_access_token = ENV["ACCESS_TOKEN"]
  config.app_id = 256014458610343
  config.app_secret = ENV["FB_APP_SECRET"]
  # See Koala::Configuration for more options, including details on how to send requests through
  # your own proxy servers.
end
