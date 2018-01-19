require "adapter_finder"

RSpec.describe AdapterFinder do
  describe "#adapter_for" do
    it "returns the first matching adapter" do
      expect(described_class.adapter_for("https://flickr.com/photo/1")).
        to eq Adapters::FlickrAdapter

      expect(described_class.adapter_for("https://youtube.com/video/1")).
        to eq Adapters::YouTubeAdapter
    end

    it "raises an exception for unrecognised URLs" do
      unknown_url = "https://unknown.example"
      expected_exception = AdapterFinder::NoAdapterFound
      expected_message = "No adapter available for '#{unknown_url}'"

      expect { described_class.adapter_for(unknown_url) }.
        to raise_exception expected_exception, expected_message
    end
  end
end
