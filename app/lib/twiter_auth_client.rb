class TwitterAuthClient
  class << self
    def get_twitter_client options = {}
      params = {
        :consumer_key => 'RyuoZAVME2iBCYwkmaBvsUHQ7',
        :consumer_secret => 'ZvVksvx0enS9BzuHeynepHotehIuDHgxGhpvqxZAqilG7gnybX'
      }
      params.merge options
      TwitterOAuth::Client.new(params)
    end
  end
end
