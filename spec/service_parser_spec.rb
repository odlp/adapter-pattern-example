require "service_parser"

RSpec.describe ServiceParser do
  describe "#adapter_for" do
    it "returns the first matching adapter" do
      expect(described_class.adapter_for("https://flickr.com/photo/1")).
        to eq Adapters::FlickrAdapter

      expect(described_class.adapter_for("https://youtube.com/video/1")).
        to eq Adapters::YouTubeAdapter
    end

    it "raises an exception for unrecognised URLs" do
      unknown_url = "https://unknown.example"
      expected_exception = ServiceParser::UnrecognisedServiceError

      expect { described_class.adapter_for(unknown_url) }.
        to raise_exception expected_exception, "Unrecognised service '#{unknown_url}'"
    end
  end
end
