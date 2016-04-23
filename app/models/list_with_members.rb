class ListWithMembers
  include ActiveModel::Model
  include Twitter::REST::Lists
  attr_accessor :list, :members

  def members
    @members ||= twitter.list_members(list, count: 200)
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
