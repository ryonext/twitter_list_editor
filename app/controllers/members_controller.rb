class MembersController < ApplicationController
  def index
    member_id_lists = twitter.list_members(params[:list_id].to_i, count: 200).map(&:id_str)
    render json: member_id_lists
  end

  def create
    twitter.add_list_member(member_params[:list].to_i, member_params[:user].to_i)
    render nothing: true
  end

  def destroy
    twitter.remove_list_member(member_params[:list].to_i, member_params[:user].to_i)
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
