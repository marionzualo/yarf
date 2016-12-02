require "yarf/version"

module Yarf
  Rack::Handler::WEBrick.run ->(env){ [200, {'Content-Type'  => 'text/plain'}, ["Hello, world!"]]}
end
