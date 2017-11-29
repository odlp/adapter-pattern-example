# Adapter pattern

Riffing on the adapter pattern from:
[http://legacy.new-bamboo.co.uk/blog/2008/02/05/micro-patterns-in-ruby/](http://legacy.new-bamboo.co.uk/blog/2008/02/05/micro-patterns-in-ruby/)

Takes a different approach of finding constant within a module that respond to `#match?`, avoiding inheritance and class variables.

## Reference implementation

From the blog post:

```ruby
# = The superclass / factory
class ServiceParser
  # We register adapters into this class variable
  #
  @@adapters = []

  # class reader
  #
  def self.adapters
    @@adapters
  end

  # Factory method here, se below...
  #
end

# = An example subclass / adapter
class FlickrAdapter < ServiceParser
  def initialize( url)

  end

  # API methods
  #
  def thumbnail
    # do something clever here...
  end

  # register ourselves with the Factory
  #
  ServiceParser.adapters << [self, /flickr\.com/]
end
```

Differences with this implementation:

- No `@@adapters` class variable
- Adapters don't need to add themselves into the `@@adapters` array (`ServiceParser.adapters <<`)

## Getting started

```
bundle install
bundle exec rspec
```
