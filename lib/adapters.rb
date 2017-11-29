module Adapters
end

adapter_files_glob = File.expand_path("./adapters/*.rb", __dir__)
Dir[adapter_files_glob].each { |file| require file }
