require_relative "adapters"

class AdapterFinder
  def self.adapter_for(raw_url)
    matched_adapter = all_adapters.detect do |adapter|
      adapter.match?(raw_url)
    end

    matched_adapter || raise_no_adapter(raw_url)
  end

  def self.all_adapters
    Adapters.constants.
      map { |const| Adapters.const_get(const) }.
      select { |const| const.respond_to?(:match?) }
  end

  def self.raise_no_adapter(raw_url)
    raise NoAdapterFound.new(raw_url)
  end

  class NoAdapterFound < StandardError
    attr_reader :raw_url

    def initialize(raw_url)
      @raw_url = raw_url
      super "No adapter available for '#{raw_url}'"
    end
  end
end
