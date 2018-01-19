require_relative "adapters"

class AdapterFinder
  def self.adapter_for(raw_url)
    matched_adapter = all.detect { |adapter| adapter.match?(raw_url) }

    matched_adapter || raise(NoAdapterFound, raw_url)
  end

  def self.all
    Adapters.constants.
      map { |const| Adapters.const_get(const) }.
      select { |const| const.respond_to?(:match?) }
  end

  private_class_method :all

  class NoAdapterFound < StandardError
    attr_reader :raw_url

    def initialize(raw_url)
      @raw_url = raw_url
      super "No adapter available for '#{raw_url}'"
    end
  end
end
