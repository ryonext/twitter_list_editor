class DashboardsController < ApplicationController
  FRIENDS_COUNT = 200

  def show
    response = twitter.friends(cursor: params[:cursor], count: FRIENDS_COUNT)
    @next = response.attrs[:next_cursor]
    @friends = response.take(FRIENDS_COUNT)
    @lists = twitter.lists.sort_by(&:name)
  end

  private

    def twitter
      @twitter ||= Twitter::REST::Client.new do |config|
        config.consumer_key = ENV["CONSUMER_KEY"]
        config.consumer_secret = ENV["CONSUMER_SECRET"]
        config.access_token = ENV["ACCESS_TOKEN"]
        config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
      end
    end
end
