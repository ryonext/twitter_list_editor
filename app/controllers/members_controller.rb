class MembersController < ApplicationController
  def create
    twitter.add_list_member(member_params[:list], member_params[:user])
    render nothing: true
  end

  private

    def member_params
      params.require(:member).permit(:list, :user)
    end

    def twitter
      @twitter ||= Twitter::REST::Client.new do |config|
        config.consumer_key = ENV["CONSUMER_KEY"]
        config.consumer_secret = ENV["CONSUMER_SECRET"]
        config.access_token = ENV["ACCESS_TOKEN"]
        config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
      end
    end
end
