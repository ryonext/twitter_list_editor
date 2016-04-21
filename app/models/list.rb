class List
  include ActiveModel::Model

  class << self
    def all(cursor: nil)
      client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV["CONSUMER_KEY"]
        config.consumer_secret = ENV["CONSUMER_SECRET"]
        config.access_token = ENV["ACCESS_TOKEN"]
        config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
      end

      client.friends(cursor: cursor)
    end
  end
end
