class DashboardsController < ApplicationController
  FRIENDS_COUNT = (ENV["FRIENDS_COUNT"] || 200).to_i

  def show
    response = twitter.friends(cursor: params[:cursor], count: FRIENDS_COUNT)
    gon.next = response.attrs[:next_cursor]
    gon.friends = @friends = response.take(FRIENDS_COUNT)
    lists = twitter.lists.sort_by(&:name)
    @lists = lists.map {|l| List.new(list: l) }
    gon.list_members = @lists.map do |l|
      {
        list: l.list,
        members: [],
        completed: false,
      }
    end
    gon.current_user_id = twitter.user.id

  end
end
