require "rack"
require "yarf_dependencies"

Rack::Handler::WEBrick.run Yarf::WebApp
