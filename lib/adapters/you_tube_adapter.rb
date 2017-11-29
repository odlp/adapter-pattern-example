module Adapters
  class YouTubeAdapter
    def self.match?(raw_url)
      raw_url =~ /youtube\.com/
    end

    def initialize(raw_url)
      # Do something
    end
  end
end
