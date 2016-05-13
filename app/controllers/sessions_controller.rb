class SessionsController < ApplicationController
  def new
  end

  def create
    client = TwitterOAuth::Client.new(
      consumer_key: ENV["CONSUMER_KEY"],
      consumer_secret: ENV["CONSUMER_SECRET"],
    )
    request_token = client.request_token(oauth_callback: "http://localhost:3000/session/callback")
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect_to request_token.authorize_url
  end

  def callback
    client = TwitterOAuth::Client.new(
      consumer_key: ENV["CONSUMER_KEY"],
      consumer_secret: ENV["CONSUMER_SECRET"],
    )
    access_token = client.authorize(
      session[:request_token],
      session[:request_token_secret],
      oauth_verifier: params[:oauth_verifier],
    )
    session[:access_token] = access_token.token
    session[:access_token_secret] = access_token.secret
    redirect_to "/"
  end
end
