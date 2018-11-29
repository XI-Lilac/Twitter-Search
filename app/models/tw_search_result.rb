class TwSearchResult
  include ActiveModel::Model

  attr_accessor :word, :tweet
  validates :word, presence: true
 
  def client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_API_KEY"]
      config.consumer_secret = ENV["TWITTER_API_SECRET_KEY"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  	end
  	
  end
end
