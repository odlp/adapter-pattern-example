module Adapters
  class FlickrAdapter
    def self.match?(raw_url)
      raw_url =~ /flickr\.com/
    end

    def initialize(raw_url)
      # Do something
    end
  end
end
