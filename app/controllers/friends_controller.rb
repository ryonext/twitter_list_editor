class FriendsController < ApplicationController
  FRIENDS_COUNT = (ENV["FRIENDS_COUNT"] || 200).to_i

  def index
    response = twitter.friends(cursor: params[:cursor], count: FRIENDS_COUNT)
    @friends = response.take(FRIENDS_COUNT)
    @next = response.attrs[:next_cursor]
  end
end
