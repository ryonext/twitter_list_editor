class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  FRIENDS_COUNT = (ENV["FRIENDS_COUNT"] || 200).to_i

  private

    def login_required
      unless session[:access_token]
        redirect_to new_session_path
      end
    end

    def twitter
      @twitter ||= Twitter::REST::Client.new do |config|
        config.consumer_key = ENV["CONSUMER_KEY"]
        config.consumer_secret = ENV["CONSUMER_SECRET"]
        config.access_token = session[:access_token]
        config.access_token_secret = session[:access_token_secret]
      end
    end
end
