class SessionsController < ApplicationController
  def new
  end

  def create
    request_token = oauth_client.request_token(oauth_callback: callback_url)
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect_to request_token.authorize_url
  end

  def callback
    access_token = oauth_client.authorize(
      session[:request_token],
      session[:request_token_secret],
      oauth_verifier: params[:oauth_verifier],
    )
    session[:access_token] = access_token.token
    session[:access_token_secret] = access_token.secret
    redirect_to root_path
  end

  private

    def callback_url
      host = ENV["HOST"] || "http://localhost:3000"
      File.join(host, "/session/callback")
    end

    def oauth_client
      @oauth_client ||= TwitterOAuth::Client.new(
        consumer_key: ENV["CONSUMER_KEY"],
        consumer_secret: ENV["CONSUMER_SECRET"],
      )
    end
end
