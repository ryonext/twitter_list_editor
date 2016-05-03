class DashboardsController < ApplicationController
  FRIENDS_COUNT = (ENV["FRIENDS_COUNT"] || 200).to_i

  def show
    response = twitter.friends(cursor: params[:cursor], count: FRIENDS_COUNT)
    @next = response.attrs[:next_cursor]
    gon.friends = @friends = response.take(FRIENDS_COUNT)
    lists = twitter.lists.sort_by(&:name)
    @lists = lists.map {|l| List.new(list: l) }
    gon.list_members = @lists.map do |l|
      {
        list: l.list,
        members: l.members.map {|m| m.to_h[:id_str] }
      }
    end
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
