require_relative "adapters"

class ServiceParser
  def self.adapter_for(raw_url)
    matched_adapter = all_adapters.detect do |adapter|
      adapter.match?(raw_url)
    end

    matched_adapter || raise_unrecognised_url(raw_url)
  end

  def self.all_adapters
    Adapters.constants.
      map { |const| Adapters.const_get(const) }.
      select { |const| const.respond_to?(:match?) }
  end

  def self.raise_unrecognised_url(raw_url)
    raise UnrecognisedServiceError.new(raw_url)
  end

  class UnrecognisedServiceError < StandardError
    def initialize(raw_url)
      super "Unrecognised service '#{raw_url}'"
    end
  end
end
