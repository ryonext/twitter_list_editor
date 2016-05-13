class SessionsController < ApplicationController
  def new
  end

  def create
    client = TwitterOAuth::Client.new(
      consumer_key: ENV["CONSUMER_KEY"],
      consumer_secret: ENV["CONSUMER_SECRET"],
    )
    request_token = client.request_token(oauth_callback: "/oauth/callback")
    redirect_to request_token.authorize_url
  end
end
